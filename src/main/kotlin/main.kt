package imdb
import java.io.File

fun filePath(fileName: String = ""): String = "/home/jlopez/imdb/$fileName"
fun fileString(filePath: String): List<String> = File(filePath).readLines()

fun main() {
    val imdbFiles: FileTreeWalk = File(filePath()).walk()
    for(f in imdbFiles) {
        println(f)
    }
}