'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"main.dart.js": "9647c599f308e95d06ee4a947c1af7a3",
"assets/NOTICES": "473c51423fe80cc338192c076034c727",
"assets/FontManifest.json": "38d088b85cbd1af87912c7c23d2f652a",
"assets/assets/images/units/infantry.png": "e5f6cd6261075c4b2f7bcb859c3f7fc9",
"assets/assets/images/units/aircraft.png": "8962eddba97e457a871e56bdaae4c305",
"assets/assets/images/units/vehicle.png": "6d958c1b6f25d0bfc532c1a9995b0c04",
"assets/assets/images/buildings/propaganda_station.png": "c44621ff3d3e7f3b9db26f2a743b17cf",
"assets/assets/images/buildings/supply_center.png": "6f65542c91a92c286fe94bca1d8d3f13",
"assets/assets/images/buildings/missile_silo.png": "39a7bb092f5247ce4c665b3a864d3235",
"assets/assets/images/buildings/power_plant.png": "f0d7e824ab6b3b0beca1d612eb0a0f4e",
"assets/assets/images/buildings/military_facility.png": "defcae7066ac427e1bf1837baf37d268",
"assets/assets/images/buildings/tech_lab.png": "1feb6660a2e586bff5a1ccaa698813e9",
"assets/assets/images/countries/il.png": "8bf2bc4a55f5d66f4183fdeb37720196",
"assets/assets/images/countries/pk.png": "0e776d4308e95d9674e94ca89e47fe76",
"assets/assets/images/countries/cn.png": "4cefb635ae2d69961a43c5737a62f5e1",
"assets/assets/images/countries/kp.png": "5987ca807a7cdb9b77f5d7dd3e7f111d",
"assets/assets/images/countries/us.png": "fb3848de75cb22148ae7e88c8e2a8be6",
"assets/assets/images/countries/in.png": "34cd2097983977092c01937ea670b401",
"assets/assets/images/countries/gb.png": "026d0aa762c56bb53e19045b07c949a1",
"assets/assets/images/countries/fr.png": "8d1cc2cd2fadb29cdd48c2a65cbbe6ed",
"assets/assets/images/countries/ru.png": "aa2555896f906b46659c4b034af63552",
"assets/assets/images/research/missiles_active_tracking.png": "0b0fa7255f388a421139780c60e58e0f",
"assets/assets/images/research/resources_production_chain.png": "92288db928dd5b445a8fa22540458f1e",
"assets/assets/images/research/military_infantry_cost.png": "a24fbe72a276872f25af43fb303f94db",
"assets/assets/images/research/military_vehicles_cost.png": "21a7348324a301a7720b44c038963bf4",
"assets/assets/images/research/warning_missiles_radar_network.png": "b89951061bac83cf1df8e879f7c2d753",
"assets/assets/images/research/resources_grid_management.png": "b8771a2a59efb59baa2158cb53541c1c",
"assets/assets/images/research/warning_military_fast_deployments.png": "d46377e3a961b2184cac610e9723a4c3",
"assets/assets/images/research/resources_quantum_computing.png": "d041c425f7914b0cbd9d8c1e6b1b08f4",
"assets/assets/images/research/missiles_assembly_automation.png": "cb95c1abe25e88e7ca95f9eafde40561",
"assets/assets/images/research/resources_indoctrination.png": "e40babe14fcb0e5ce56d1e4c680f00aa",
"assets/assets/images/research/warning_military_early_warning.png": "627c0b848fbdc0f958eaff918fecb1c9",
"assets/assets/images/research/missiles_signal_jamming.png": "cf8550a6009dc34172818a0c795f6ebd",
"assets/assets/images/research/missiles_additive_manufacturing.png": "bbbe781e7943ab57cd1b76de82059d50",
"assets/assets/images/research/military_infantry_time.png": "a24fbe72a276872f25af43fb303f94db",
"assets/assets/images/research/weapons_nuclear_bomb.png": "ae19cf7313f9c189f39c1ad6d4396eb9",
"assets/assets/images/research/resilience_bomb_shelters.png": "ee41746f6a39c485abf0c531f4f10bdc",
"assets/assets/images/research/military_aircraft_cost.png": "d89eac28801ca6bba38b9489e7fb5360",
"assets/assets/images/research/military_vehicles_time.png": "21a7348324a301a7720b44c038963bf4",
"assets/assets/images/research/intel_technology.png": "dcae1682af327d16d4919342808547be",
"assets/assets/images/research/warning_missiles_hypersonic_propulsion.png": "e8024d6e4cb682711789173c6691b253",
"assets/assets/images/research/intel_economy.png": "dcae1682af327d16d4919342808547be",
"assets/assets/images/research/military_aircraft_time.png": "d89eac28801ca6bba38b9489e7fb5360",
"assets/assets/images/research/intel_military.png": "dcae1682af327d16d4919342808547be",
"assets/assets/images/missiles/defense.png": "a6ca0edc1e705874d5acb6592835f9b0",
"assets/assets/images/missiles/attack.png": "8cb639cab7d1f7f6614157dd67fef51b",
"assets/assets/fonts/HellasCour-Regular.ttf": "0292d8c2f850c8e3fa7967092bdc9ed1",
"assets/fonts/MaterialIcons-Regular.otf": "10f8373394aba315478b5edb306d31a7",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "b5637c87bb7a245be7cde0c8ad6e7d8f",
"assets/AssetManifest.json": "1c9791dc2fa5db6a63ae3d924aaaab76",
"assets/AssetManifest.bin.json": "a397a12e4565dae75b046eba230441dc",
"manifest.json": "c34eb726612a72eb29c4a2466dc489df",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"firebase-messaging-sw.js": "5b8b5435d89eea9d02ed9ea9565635c6",
"favicon.png": "70a31eb877b5e97fdb9a12a5a469dc1a",
"version.json": "0ff45af32d7b9fd732a03f7d2ed6a3af",
"index.html": "876fa9c91a27be693b693a325f8f116c",
"/": "876fa9c91a27be693b693a325f8f116c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
