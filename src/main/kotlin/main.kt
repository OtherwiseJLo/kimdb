package imdb

import java.io.File

data class title_akas(val titleId: String,
					  val ordering: Int,
					  val title: String,
					  val region: String,
					  val language: String,
					  val types: List<String>,
					  val attributes: List<String>,
					  val isOriginalTitle: Boolean);

data class title_basics(val tconst: String,
						val titleType: String,
						val primaryTitle: String,
						val originalTitle: String,
						val originalTitle: String,
						val isAdult: Boolean,
						val startYear: List<String>,
						val endYear: Boolean,
						val runtimeMinutes: Int,
						val genres: List<String>);

fun filePath(fileName: String = ""): String = "/home/jlopez/imdb/$fileName"
fun fileString(filePath: String): List<String> = File(filePath).readLines()

fun main() {
	val imdbFiles: FileTreeWalk = File(filePath()).walk()
	for (f in imdbFiles) {
		println(f)
	}
}

fun createDataClases() {

}