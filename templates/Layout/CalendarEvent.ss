<br />

<% if $Tickets %>
  <% loop $Tickets %>
    <% if $Now >= $StartDate %>
      <% if $Now <= $EndDate %>

      <div class="event-booking-widget">

          <i class="fa fa-thumb-tack"></i>

          <h2>Book Event</h2>
          <div class="users">
          </div>

          <form id="register-form" method="post" action="/eventregister" data-parsley-validate>

            <input type="hidden" name="event" class="event" value="$Top.ID" />
            <input type="hidden" name="url_email" class="url-email" value="$Top.PopulateForm.Email" />

            <% loop $Top.DateTimes %>
            
              <input type="hidden" name="date" class="date" value="$ID" />

            <% end_loop %>

            


              <div class="form-group">
                <input type="text" class="form-control first_name" name="first_name" placeholder="First Name" data-parsley-required="true" value="$Top.PopulateForm.FirstName">
              </div>

              <div class="form-group">
                <input type="text" class="form-control surname" name="surname" placeholder="Surname" data-parsley-required="true" value="$Top.PopulateForm.Surname">
              </div>

              <div class="form-group">
                <input type="email" class="form-control email" name="email" placeholder="Email" data-parsley-required="true" value="$Top.PopulateForm.Email">
              </div>

              <div class="form-group">
                <input type="text" class="form-control business" name="business" placeholder="Business" value="$Top.PopulateForm.Business">
              </div>

              <div class="form-group">
                <input type="text" class="form-control position" name="position" placeholder="Position" value="$Top.PopulateForm.Position">
              </div>

              <%-- <div class="form-group">
                <select name="date" class="date cs-select cs-skin-border">
                  <% loop $Top.DateTimes %>

                    <option value="$ID">$DateRange <% if AllDay %><% _t('ALLDAY','All Day') %><% else %><% if StartTime %>$TimeRange<% end_if %><% end_if %></option>

                  <% end_loop %>
                </select>
              </div> --%>

              <div class="form-group">
                <select class="cs-select dietary" name="dietary">
                  <option value="None">Dietary Requirements</option>
                  <option value="Dietary Requirements 1">Dietary Requirements 1</option>
                  <option value="Dietary Requirements 2">Dietary Requirements 2</option>
                  <option value="Dietary Requirements 3">Dietary Requirements 3</option>
                  <option value="Dietary Requirements 4">Dietary Requirements 4</option>
                  <option value="Dietary Requirements 5">Dietary Requirements 5</option>
                </select>
              </div>

            <div class="add-member">Add additional attendee</div>

            <button type="submit" class="book-event"><h2>Book Event</h2></button>
            
          </form>
        </div>  

      <% else %>
        <p>Tickets are not currently avaliable.</p>
      <% end_if %>
    <% end_if %>
  <% end_loop %>
<% end_if %>

<div class="events-container">
  <% if Header %>
    <header class="event-header title-font">
      <% if FeaturedImage %>
        $FeaturedImage.SetWidth(240)
      <% end_if %>
    <div class="event-text">$Header</div>
    </header>
    <% else %>
      <% if FeaturedImage %>
        <div class="featured-image scaled-image force-scaling">
          $FeaturedImage.SetWidth(240)
        </div>
      <% end_if %>  
  <% end_if %>

  <h1>$Title</h1>

  <% if $CustomSidebarInfo%>

    <div class="sidebar-info">

      $CustomSidebarInfo

    </div>

  <% end_if %>

  $Content

  <% if $DateTimes %>
  
    <div class="date-box">
        <ul>
          <li><strong>Date:</strong></li>
          <% loop $DateTimes %>
            <li>
                $DateRange 
                <% if AllDay %>
                  <% _t('ALLDAY','All Day') %>
                <% else %>
                  <% if StartTime %>
                    $TimeRange
                  <% end_if %>
                <% end_if %>
                
                </li>
              <li>
                <a class="ics" href="$ICSLink"><% _t('ADD','Add this to Calendar') %><i class="fa fa-calendar"></i></a>
              </li>
          <% end_loop %>
        </ul>
        

      <% if Venue%>

        <ul>
          <li><strong>Venue:</strong></li>
          <li>$Venue</li>
        </ul>

      <% end_if %>
      
    </div>

  <% end_if %>
</div>