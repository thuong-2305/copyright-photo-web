package vn.edu.hcmuaf.fit.coriphoto.datetime;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class FormatDateTime {

    public static LocalDate format(String date) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        LocalDate localDate = LocalDate.parse(date, formatter);

        return localDate;
    }

}
