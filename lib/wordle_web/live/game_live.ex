defmodule WordleWeb.GameLive do
  use WordleWeb, :live_view

  def mount(_params, _session, socket) do
    guesses = List.duplicate(List.duplicate(nil, 5), 6)
    {:ok, assign(socket, guesses: guesses, active_guess: hd(guesses))}
  end

  def handle_event("key_pressed", %{"key" => value}, socket) do
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col justify-between">
      <div class="mx-auto max-w-xl">
        <.row :for={guess <- @guesses} guess={guess} />
      </div>

      <.keyboard />
    </div>
    """
  end

  def row(assigns) do
    ~H"""
    <div class="grid grid-cols-5 gap-2 text-white justify-items-center items-center my-2">
      <.cell :for={letter <- @guess} letter={letter} />
    </div>
    """
  end

  def cell(assigns) do
    ~H"""
    <%= if @letter do %>
      <div class="py-4 px-6 bg-gray-900 border border-gray-400">
        {@letter}
      </div>
    <% else %>
      <div class="py-4 px-6 bg-gray-900 border border-gray-400 before:pb-[100%] before:inline-block">
      </div>
    <% end %>
    """
  end

  def keyboard(assigns) do
    ~H"""
    <div class="max-w-2xl mx-auto">
      <div class="flex justify-center items-center">
        <.key value="q">Q</.key>
        <.key value="w">W</.key>
        <.key value="e">E</.key>
        <.key value="r">R</.key>
        <.key value="t">T</.key>
        <.key value="y">Y</.key>
        <.key value="u">U</.key>
        <.key value="i">I</.key>
        <.key value="o">O</.key>
        <.key value="p">P</.key>
      </div>
      <div class="flex justify-center items-center">
        <.key value="a">A</.key>
        <.key value="s">S</.key>
        <.key value="d">D</.key>
        <.key value="f">F</.key>
        <.key value="g">G</.key>
        <.key value="h">H</.key>
        <.key value="j">J</.key>
        <.key value="k">K</.key>
        <.key value="l">L</.key>
      </div>
      <div class="flex justify-center items-center">
        <.key value="enter">enter</.key>
        <.key value="q">Q</.key>
        <.key value="z">Z</.key>
        <.key value="x">X</.key>
        <.key value="c">C</.key>
        <.key value="v">V</.key>
        <.key value="b">B</.key>
        <.key value="n">N</.key>
        <.key value="m">M</.key>
        <.key value="backspace"><.icon name="hero-backspace" /></.key>
      </div>
    </div>
    """
  end

  def key(assigns) do
    ~H"""
    <div class="text-white flex-1 flex justify-center mt-2 mx-1">
      <.button phx-click="key_pressed" phx-value-key={@value} class="p-2 text-lg">
        {render_slot(@inner_block)}
      </.button>
    </div>
    """
  end
end
