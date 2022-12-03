package movie.model;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class IndeMovieBean {
   private int num;
   @NotBlank(message="종류 선택")
   private String kind;
   @NotBlank(message="영화명 입력")
   private String title;
   @NotBlank(message="메인사진 첨부")
   private String img;
   @NotBlank(message="감독 입력")
   private String director;
   @NotBlank(message="제작연도 입력")
   private String year;
   @NotBlank(message="장르 입력")
   private String genre;
   @NotBlank(message="컬러 선택")
   private String color;
   @NotBlank(message="상영포맷 입력")
   private String type;
   @NotBlank(message="러닝타임 입력")
   private String runtime;
   @NotBlank(message="월드프리미어 선택")
   private String premiere;
   @NotBlank(message="시놉시스 입력")
   private String synopsis;
   @NotBlank(message="인텐션 입력")
   private String intention;
   @NotBlank(message="수상경력 입력")
   private String fest_awards;
   @NotBlank(message="감독사진 첨부")
   private String direc_img1;
   @NotBlank(message="감독경력 입력")
   private String direc_info1;
   private String direc_img2;
   private String direc_info2;
   @NotBlank(message="줄거리 입력")
   private String note;
   @NotBlank(message="영상링크 첨부")
   private String video;
   private String likes;
   
   private MultipartFile upload; // a.jpg X
   public MultipartFile getUpload() {
      return upload;
   }
   public void setUpload(MultipartFile upload) { // upload=a.jpg X
      System.out.println("setUpload(MultipartFile upload)");
      this.upload = upload;
      System.out.println("setUpload upload:" + upload);
      System.out.println("upload.getName():"+upload.getName());
      System.out.println("upload.getOriginalFilename():"+upload.getOriginalFilename());
      this.img = upload.getOriginalFilename();
   }   
   
   private MultipartFile upload1; // a.jpg X
   public MultipartFile getUpload1() {
      return upload1;
   }
   public void setUpload1(MultipartFile upload1) { // upload=a.jpg X
      System.out.println("setUpload1(MultipartFile upload1)");
      this.upload1 = upload1;
      System.out.println("setUpload upload1:" + upload1);
      System.out.println("upload1.getName():"+upload1.getName());
      System.out.println("upload1.getOriginalFilename():"+upload1.getOriginalFilename());
      this.direc_img1 = upload1.getOriginalFilename();
   }   
   
   private MultipartFile upload2; // a.jpg X
   public MultipartFile getUpload2() {
      return upload2;
   }
   public void setUpload2(MultipartFile upload2) { // upload=a.jpg X
      System.out.println("setUpload2(MultipartFile upload2)");
      this.upload2 = upload2;
      System.out.println("setUpload2 upload2:" + upload2);
      System.out.println("upload2.getName():"+upload2.getName());
      System.out.println("upload2.getOriginalFilename():"+upload2.getOriginalFilename());
      this.direc_img2 = upload2.getOriginalFilename();
   }
   
   
   
   public String getLikes() {
      return likes;
   }
   public void setLikes(String likes) {
      this.likes = likes;
   }
   public int getNum() {
      return num;
   }
   public void setNum(int num) {
      this.num = num;
   }
   public String getKind() {
      return kind;
   }
   public void setKind(String kind) {
      this.kind = kind;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getImg() {
      return img;
   }
   public void setImg(String img) {
      this.img = img;
   }
   public String getDirector() {
      return director;
   }
   public void setDirector(String director) {
      this.director = director;
   }
   public String getYear() {
      return year;
   }
   public void setYear(String year) {
      this.year = year;
   }
   public String getGenre() {
      return genre;
   }
   public void setGenre(String genre) {
      this.genre = genre;
   }
   public String getColor() {
      return color;
   }
   public void setColor(String color) {
      this.color = color;
   }
   public String getType() {
      return type;
   }
   public void setType(String type) {
      this.type = type;
   }
   public String getRuntime() {
      return runtime;
   }
   public void setRuntime(String runtime) {
      this.runtime = runtime;
   }
   public String getPremiere() {
      return premiere;
   }
   public void setPremiere(String premiere) {
      this.premiere = premiere;
   }
   public String getSynopsis() {
      return synopsis;
   }
   public void setSynopsis(String synopsis) {
      this.synopsis = synopsis;
   }
   public String getIntention() {
      return intention;
   }
   public void setIntention(String intention) {
      this.intention = intention;
   }
   public String getFest_awards() {
      return fest_awards;
   }
   public void setFest_awards(String fest_awards) {
      this.fest_awards = fest_awards;
   }
   public String getDirec_img1() {
      return direc_img1;
   }
   public void setDirec_img1(String direc_img1) {
      this.direc_img1 = direc_img1;
   }
   public String getDirec_info1() {
      return direc_info1;
   }
   public void setDirec_info1(String direc_info1) {
      this.direc_info1 = direc_info1;
   }
   public String getDirec_img2() {
      return direc_img2;
   }
   public void setDirec_img2(String direc_img2) {
      this.direc_img2 = direc_img2;
   }
   public String getDirec_info2() {
      return direc_info2;
   }
   public void setDirec_info2(String direc_info2) {
      this.direc_info2 = direc_info2;
   }
   public String getNote() {
      return note;
   }
   public void setNote(String note) {
      this.note = note;
   }
   public String getVideo() {
      return video;
   }
   public void setVideo(String video) {
      this.video = video;
   }
   
   
   
}