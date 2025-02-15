defmodule SimpleTest do
  use ExUnit.Case, async: true
  use TestApp.DataCase, async: true

  test "my test" do
    user = admin_user()
    changeset = update_user(user, %{name: "123"})
    assert changeset.valid?
  end

  test "my better test" do
    user = admin_user()
    changeset = update_user(user, %{name: "123"})

    assert errors_on(changeset) == []
    assert changeset.valid?
  end

  defp update_user(user, attrs) do
    TestApp.Accounts.User.registration_changeset(user, attrs)
    |> IO.inspect(label: "changeset (simple_test.exs:12)")
  end

  defp admin_user() do
    %TestApp.Accounts.User{id: 42, password: "hunter2"}
  end
end
