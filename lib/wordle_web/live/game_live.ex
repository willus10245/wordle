defmodule WordleWeb.GameLive do
  use WordleWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="flex flex-col justify-between">
      <div class="">
        <.row />
        <.row />
        <.row />
        <.row />
        <.row />
        <.row />
      </div>


      <.keyboard />
    </div>
    """
  end

  def row(assigns) do
    ~H"""
    <div class="grid grid-cols-5 gap-4 text-white justify-items-center items-center">
      <div>1</div>
      <div>2</div>
      <div>3</div>
      <div>4</div>
      <div>5</div>
    </div>
    """
  end

  def keyboard(assigns) do
    ~H"""
    <div>
      <div class="flex justify-center items-center">
        <.key>Q</.key>
        <.key>W</.key>
        <.key>E</.key>
        <.key>R</.key>
        <.key>T</.key>
        <.key>Y</.key>
        <.key>U</.key>
        <.key>I</.key>
        <.key>O</.key>
        <.key>P</.key>
      </div>
      <div class="flex justify-center items-center">
        <.key>A</.key>
        <.key>S</.key>
        <.key>D</.key>
        <.key>F</.key>
        <.key>G</.key>
        <.key>H</.key>
        <.key>J</.key>
        <.key>K</.key>
        <.key>L</.key>
      </div>
      <div class="flex justify-center items-center">
        <.key>enter</.key>
        <.key>Q</.key>
        <.key>Z</.key>
        <.key>X</.key>
        <.key>C</.key>
        <.key>V</.key>
        <.key>B</.key>
        <.key>N</.key>
        <.key>M</.key>
        <.key><.icon name="hero-backspace" /></.key>
      </div>
    </div>
    """
  end

  def key(assigns) do
    ~H"""
    <div class="text-white flex-1 flex justify-center">
      <.button>
        {render_slot(@inner_block)}
      </.button>
    </div>
    """
  end
end
