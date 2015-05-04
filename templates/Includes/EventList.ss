<ul class="event-list">

<ul>

<% loop Events %>

  <li>
    <ul>
      <li>$Event.FeaturedImage.CroppedImage(200,150)</li>
      <li><h2><a href="$Event.URLSegment">$Event.Title.LimitWordCount(5)</a></h2>
     	$Content.NoHTML.LimitWordCount(12)
      <p>Date: $DateRange at $Event.Venue</p>
      
    </ul>
  </li>

<% end_loop %>

</ul>