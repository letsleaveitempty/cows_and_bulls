# Cows and Bulls


Napisz grę "cows and bulls", której zasady są następujące:
- na początku losowany jest ciąg 4 cyfr, np. 1549
- następnie użytkownik wpisując swoje 4ro cyfrowe ciągi próbuje zgadnąć wynik, przy czym dostaje informacje zwrotne:
  - każda pozycja, dla której cyfry się zgadzają oznacza 1 krowę,
  - a dla każdej cyfry, która występuje w obu ciągach, ale na różnych pozycjach wypisujemy byka.

- Wygrana jest wtedy, gdy są cztery krowy.

## Przykładowa rozgrywka:
(wylosowano 1234)

```> Podaj ciąg czterocyfrowy```

```$ 4830```

```> 1 cows, 1 bulls.```

```$ 1230```

```> 3 cows, 0 bulls.```

```$ 1234```

```> 4 cows, congratulations! Collapse```

# How to use

Easiest way to run is to copy and paste the entire `CowsAndBulls` class into irb in your terminal.
Then start playing by calling:

`CowsAndBulls.new.play`

# Tests

Tests require RSpec gem installed locally to run:

`gem install rspec`

`$ rspec cows_and_bulls.rb`
