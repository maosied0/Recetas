//
//  VideosViewController.swift
//  Recetas
//
//  Created by Jonathan Ibarra on 3/2/26.
//

import UIKit
import WebKit
// Nota: Este VC ahora puede recibir una instancia de Comida para cargar su strYoutube

class VideosViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var videosWKWebView: WKWebView!
    
    // Modelo opcional para cargar el video directamente desde una Comida
    var comida: Comida!
    
    var youtubeURL: String?
    
    // Configuración conveniente desde el exterior
    func configure(with comida: Comida) {
        self.comida = comida
        self.youtubeURL = comida.strYoutube
    }
    
    // Fábrica conveniente para crear y configurar el VC con una Comida
    /*static func make(with comida: Comida) -> VideosViewController {
        let vc = VideosViewController(nibName: "VideosViewController", bundle: nil)
        vc.configure(with: comida)
        return vc
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("VideosViewController - comida.strYoutube:", comida.strYoutube ?? "nil")
        print("VideosViewController - youtubeURL:", youtubeURL ?? "nil")
        
        // Delegado para capturar errores y eventos de navegación
        videosWKWebView.navigationDelegate = self
        
        // Configuración recomendada para reproducción inline y sin requerir interacción
        videosWKWebView.configuration.allowsInlineMediaPlayback = true
        videosWKWebView.configuration.mediaTypesRequiringUserActionForPlayback = []
        
        // Cargar el video desde `comida` si está disponible; si no, usar `youtubeURL` directamente; si no, probar con apple.com
        let candidateURL: String? = {
            if let url = comida?.strYoutube, !url.isEmpty { return url }
            if let url = youtubeURL, !url.isEmpty { return url }
            return nil
        }()
        
        if let urlString = candidateURL {
            print("Cargando YouTube con:", urlString)
            cargarVideoYouTube(url: urlString)
        } else if let testURL = URL(string: "https://www.apple.com") {
            print("No hay URL de YouTube. Cargando fallback:", testURL.absoluteString)
            videosWKWebView.load(URLRequest(url: testURL))
        }
    }
    
    func cargarVideoYouTube(url: String) {
        let embedURL = convertirAURLEmbebida(url: url)
        
        // Validar que el embed tenga un ID de video
        if embedURL == "https://www.youtube.com/embed/" {
            print("ID de video no válido. URL original:", url)
            return
        }
        
        let htmlString = """
        <!DOCTYPE html>
        <html>
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <style>
                body {
                    margin: 0;
                    padding: 0;
                    background-color: black;
                }
                .video-container {
                    position: relative;
                    padding-bottom: 56.25%;
                    height: 0;
                    overflow: hidden;
                }
                .video-container iframe {
                    position: absolute;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                }
            </style>
        </head>
        <body>
            <div class="video-container">
                <iframe src="\(embedURL)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
        </body>
        </html>
        """
        
        print("Cargando HTML para embed:", embedURL)
        //videosWKWebView.loadHTMLString(htmlString, baseURL: nil)
        
        
        let bundleId = Bundle.main.bundleIdentifier ?? ""
            let referrer = "https://\(bundleId)".lowercased()
            let referrerUrl = URL(string: referrer)!

            var request = URLRequest(url: URL(string: embedURL)!)
            request.addValue(referrerUrl.absoluteString, forHTTPHeaderField: "Referer")
            request.addValue(referrerUrl.absoluteString, forHTTPHeaderField: "origin")

        videosWKWebView.load(request) // WKWebview
        //videosWKWebView.load(URLRequest(url: URL(string: embedURL)!))
    }
    
    func convertirAURLEmbebida(url: String) -> String {
        print("convertirAURLEmbebida - url de entrada:", url)
        if url.contains("youtube.com/embed/") {
            print("URL ya es de tipo embed:", url)
            return url
        }
        
        var videoID = ""
        
        if url.contains("youtube.com/watch?v=") {
            if let range = url.range(of: "watch?v=") {
                let startIndex = range.upperBound
                videoID = String(url[startIndex...])
                if let ampersandIndex = videoID.firstIndex(of: "&") {
                    videoID = String(videoID[..<ampersandIndex])
                }
            }
        } else if url.contains("youtu.be/") {
            if let range = url.range(of: "youtu.be/") {
                let startIndex = range.upperBound
                videoID = String(url[startIndex...])
                if let questionIndex = videoID.firstIndex(of: "?") {
                    videoID = String(videoID[..<questionIndex])
                }
            }
        }
        
        let embed = "https://www.youtube.com/embed/\(videoID)"
        print("convertirAURLEmbebida - embed generado:", embed)
        return embed
    }
    
    // MARK: - WKNavigationDelegate
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("WKWebView didFail navigation with error: \(error)")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("WKWebView didFail provisional navigation with error: \(error)")
    }
 
}

