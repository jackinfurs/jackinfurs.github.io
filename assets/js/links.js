document.addEventListener("DOMContentLoaded", () => {
  const siteOrigin = location.origin;

  document.querySelectorAll("a[href]").forEach(a => {
    const href = a.getAttribute("href");
    if (href.startsWith("#")) 
	  return;

    let url;
    try {
      url = new URL(href, location.href);
	} catch {
      return;
	}

    if (url.origin !== siteOrigin) {
      a.target = "_blank";
      a.rel = "noopener";
	}
  });
});

