'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"assets/fonts/MaterialIcons-Regular.otf": "d7b4a86379686d51c2c49e8ec3243759",
"assets/AssetManifest.bin.json": "8ee5daf1314239a8da3911852a5a46ed",
"assets/AssetManifest.bin": "777fe55bd60a9cdc9d641257ccce6ce6",
"assets/AssetManifest.json": "ccf0b1f37333958af2271c1489250547",
"assets/assets/drawables/job_experience.png": "76ccd8958fde3c119dbf5fd46c446d66",
"assets/assets/drawables/chat_gpt.png": "0c0ed475f2f7ba37b3beb6670ea6f9d7",
"assets/assets/drawables/abilities_portrait.png": "24f631f25112cd8454d602d1c2ec4f6b",
"assets/assets/drawables/questionary_main_light.png": "268b632b440a39b0af51277c81c134c3",
"assets/assets/drawables/flutter.png": "068a2f1c3ee08173935031f935a29681",
"assets/assets/drawables/portfolio_main.PNG": "fb284e057ba1ad7ca9cb65d80e1e9ccd",
"assets/assets/drawables/echo_card_main.png": "458b101115943493f2e659f611af943e",
"assets/assets/drawables/appstore.png": "135e0d859fa7edd488749e1daa12bb9e",
"assets/assets/drawables/vs_code.png": "8dfd6c1e8498b8971ef60f8f8de9f003",
"assets/assets/drawables/node_js.png": "a41475ff79a461158d72d9fe63e537d5",
"assets/assets/drawables/questionary_main_dark.jpg": "a12ef0154f3cd704a16ea903f59abeae",
"assets/assets/drawables/abilities_landscape.png": "1865e4775c03e9bec10d0c8acb784133",
"assets/assets/drawables/postman.png": "76bb1bb90726d881d41196e547f82679",
"assets/assets/drawables/python.png": "9bae4c5676b0e881ea6d68894ddeebce",
"assets/assets/drawables/firebase.png": "6cbbf173f3be573edca4f2b8b7399543",
"assets/assets/drawables/jetpack_compose.png": "47d68a84872903e5728616f731619676",
"assets/assets/drawables/header_2.png": "269a8de8938beda4e689489a5c21ddaf",
"assets/assets/drawables/github.png": "e5c550c3d15d5aa002af051e26d18cfc",
"assets/assets/drawables/android_studio.png": "0c69b8ed4b1048b2765a717a88e1e8ee",
"assets/assets/drawables/playstore.png": "22ebaaf14742728202402db286a58d26",
"assets/assets/drawables/header.png": "4b198ff7625acecb419b1167d596192d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "463a85a60d7703e96a5aebda8a78b0e2",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "312deb7b398bde8609a7e00786501c25",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/NOTICES": "ce50fb1014628a7f35ac790d316bfeae",
"main.dart.js": "70b26fc2452bb97c58ddb185f36ceaff",
"manifest.json": "afbad595473125d9919e55440bb9d114",
"version.json": "cc132570d6d238130e38adc59e1f998d",
"canvaskit/skwasm.js.symbols": "ffc07b382ae1e2cf61303ec4391ea4ad",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/skwasm_heavy.js.symbols": "b68a224b193a61133813a90fe58898a6",
"canvaskit/skwasm.wasm": "11199b1ab0318df784d266b683cf5b5e",
"canvaskit/canvaskit.wasm": "5a48c3461a11f40f5cc2e152558af3e7",
"canvaskit/canvaskit.js.symbols": "e3cc169dd15213381373db1f9ef39f3e",
"canvaskit/skwasm_heavy.wasm": "126e7cd71ed5dc8161d5210ee14db260",
"canvaskit/skwasm.js": "4087d5eaf9b62d309478803602d8e131",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.wasm": "79d736074b25feb64730127812c13239",
"canvaskit/chromium/canvaskit.js.symbols": "8fce22f4d72ad11f225a4999cd247660",
"canvaskit/skwasm_heavy.js": "dddba7cbf636e5e28af8de827a6e5b49",
"flutter_bootstrap.js": "cccc57d6019429a4e727cc0f2a3c7389",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"index.html": "12cc238c322efdb14ffb466b73b7326a",
"/": "12cc238c322efdb14ffb466b73b7326a",
"flutter.js": "2a09505589bbbd07ac54b434883c2f03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
