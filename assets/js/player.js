(async () => {
  let playlist = [];
  let shuffledPlaylist = [];
  let currentIndex = 0;
  const audio = document.getElementById("audio");
  const playPauseBtn = document.getElementById("playPauseBtn");
  const nextBtn = document.getElementById("nextBtn");
  const trackName = document.getElementById("trackName");

  async function init() {
    try {
      const response = await fetch('/assets/music/playlist.json');
      playlist = await response.json();
      shufflePlaylist();
      currentIndex = Math.floor(Math.random() * shuffledPlaylist.length);
      loadTrack(currentIndex);
    } catch (e) {
      console.error('loading playlist failed:', e);
    }
  }

  function shufflePlaylist() {
    shuffledPlaylist = [...playlist];
    for (let i = shuffledPlaylist.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [shuffledPlaylist[i], shuffledPlaylist[j]] = [shuffledPlaylist[j], shuffledPlaylist[i]];
    }
  }

  function loadTrack(index) {
    currentIndex = index;
    audio.src = `/assets/music/${shuffledPlaylist[currentIndex].src}`;
    trackName.textContent = shuffledPlaylist[currentIndex].src;
  }

  function playTrack() {
    audio.play();
    playPauseBtn.textContent = "||";
  }

  function pauseTrack() {
    audio.pause();
    playPauseBtn.textContent = ">";
  }

  function togglePlayPause() {
    if (audio.paused) {
      playTrack();
    } else {
      pauseTrack();
    }
  }

  function nextTrack() {
    currentIndex++;
    if (currentIndex >= shuffledPlaylist.length) {
      shufflePlaylist();
      currentIndex = 0;
    }
    loadTrack(currentIndex);
    playTrack();
  }

  playPauseBtn.addEventListener("click", togglePlayPause);
  nextBtn.addEventListener("click", nextTrack);
  audio.addEventListener("ended", nextTrack);

  await init();
})();

