<div class="container">

  <!--<div class="alert alertsuccess">ツイートを投稿しました</div>-->
  <% if flash[:notice] %>
    <div class="alert alertsuccess"><%= flash[:notice] %></div>
  <% end %>
  <h1>つぶやき一覧</h1>
  
<article>
    <div class="contents">
        <ul>
            <!--<li class="colmd6">contents1</li>-->
            <!--<li class="colmd6">contents2</li>-->
            
            <table class="table tablestriped">
              <% @twitters.each do |twitter| %>
                <tr>
                  <td><%= twitter.title %></td>
                  <td><%= twitter.content %></td>
                  <td><button type="submit" class="btn btn-default"><%= link_to '詳細を確認する', twitter_path(twitter.id) %></button></td>
                  <td><button type="submit" class="btn btn-default"><%= link_to "ブログを編集する", edit_twitter_path(twitter.id) %></button></td>
                  <td><button type="submit" class="btn btn-default"><%= link_to 'ブログを削除する', twitter_path(twitter.id), method: :delete %></button></td>
                </tr>
              <% end %>
            </table>
            <br>

           <%= link_to '新しくブログを投稿する', new_twitter_path %>

        </ul>
    </div>
</article>
  </div>
