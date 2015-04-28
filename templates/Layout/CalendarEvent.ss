<div id="left-column">
  <% if showSecondaryNav %>
    <p id="left-nav-heading">In this section&hellip;</p>
    <% include LeftNav %>
  <% else %>
    &nbsp;
  <% end_if %>
</div>

<div id="middle-column">
  <div id="content">
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
    <div class="event-details">
      <ul>
        <% if Info %>
        $Info
        <% else_if Date || Time %>
          <li>
            <strong>
              <% if Date %>$Date.Format(l j F)<% end_if %>
              <% if Time %><br>$Time<% end_if %>
            </strong>
          </li>
        <% end_if %>
        <% if Venue%>
          <li>
            <% if Venue %><span class="orange">$Venue</span><br><% end_if %>
          </li>
        <% end_if %>
        <% if Comment %>
          <li>$Comment</li>
        <% end_if %>
        <li>
          For more information:<br>
          <strong class="orange">
            Julian Hughes
            <br>027 2489545
            <br><a href="mailto:julian.hughes@zeroharm.org.nz">julian.hughes@
            <br>zeroharm.org.nz</a>
          </strong>
        </li>
        <% if Email %>
        <li>
          <a href="mailto:$Email?subject=RSVP – $Title" class="rsvp-button">RSVP</a>
        </li>
        <% end_if %>
      </ul>
    </div>
    <% if MetaDescription %>
      <p class="description">$MetaDescription</p>
    <% end_if %>
    $Content

    <% loop $DateTimes %>

      <strong>$DateRange <% if AllDay %><% _t('ALLDAY','All Day') %><% else %><% if StartTime %>$TimeRange<% end_if %><% end_if %></strong>

    <% end_loop %>

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

    <% if $Tickets %>
      <% loop $Tickets %>
        <% if $Now >= $StartDate %>
          <% if $Now <= $EndDate %>
            <div class="users">
            </div>

            <form id="register-form" method="post" action="/eventregister" data-parsley-validate>

              <input type="hidden" name="event" class="event" value="$Top.ID" />
              <input type="hidden" name="url_email" class="url-email" value="$Top.PopulateForm.Email" />

              <label for="date">Date</label>
              <div class="form-group">
                <select name="date" class="date">
                  <% loop $Top.DateTimes %>

                    <option value="$ID">$DateRange <% if AllDay %><% _t('ALLDAY','All Day') %><% else %><% if StartTime %>$TimeRange<% end_if %><% end_if %></option>

                  <% end_loop %>
                </select>
              </div>

              <div class="member-details">
                <div class="form-group">
                  <label for="position">Position</label>
                  <input type="text" class="form-control position" name="position" placeholder="Position" value="$Top.PopulateForm.Position">
                </div>

                <div class="form-group">
                  <label for="business">Business</label>
                  <input type="text" class="form-control business" name="business" placeholder="Business" value="$Top.PopulateForm.Business">
                </div>

                <div class="form-group">
                  <label for="first_name">First Name</label>
                  <input type="text" class="form-control first_name" name="first_name" placeholder="First Name" data-parsley-required="true" value="$Top.PopulateForm.FirstName">
                </div>

                <div class="form-group">
                  <label for="surname">Surname</label>
                  <input type="text" class="form-control surname" name="surname" placeholder="Surname" data-parsley-required="true" value="$Top.PopulateForm.Surname">
                </div>

                <div class="form-group">
                  <label for="email">Email</label>
                  <input type="email" class="form-control email" name="email" placeholder="Email" data-parsley-required="true" value="$Top.PopulateForm.Email">
                </div>

                <div class="form-group">
                  <label for="dietary">Dietary Requirements</label>
                  <select class="form-control dietary" name="dietary">
                    <option value="None">None</option>
                    <option value="Dietary Requirements 1">Dietary Requirements 1</option>
                    <option value="Dietary Requirements 2">Dietary Requirements 2</option>
                    <option value="Dietary Requirements 3">Dietary Requirements 3</option>
                    <option value="Dietary Requirements 4">Dietary Requirements 4</option>
                    <option value="Dietary Requirements 5">Dietary Requirements 5</option>
                  </select>
                </div>
              </div>

              <br />

              <div class="add-member">Add Member</div>

              <br />

              <button type="submit" class="btn btn-default">Submit</button>
              
            </form>

          <% else %>
            <p>Tickets are not currently avaliable.</p>
          <% end_if %>
        <% end_if %>
      <% end_loop %>
    <% end_if %>

  </div>
</div>

