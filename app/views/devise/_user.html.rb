<tr>
          <td class="border px-4 py-2 text-center"><%= user.nickname %></td>
          <td class="border px-4 py-2 text-center"><%= user.email %></td>
          <td class="border px-4 py-2 text-center">
            <a href="<%= user_path(user) %>" class="text-blue-500 hover:text-blue-700">View User</a>
          </td>
        </tr>
