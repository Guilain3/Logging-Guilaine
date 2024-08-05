package logging;

import java.util.logging.Formatter;
import java.util.logging.LogRecord;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CustomFormatter extends Formatter {
    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Override
    public String format(LogRecord record) {
        return String.format("%s [%s] %s - %s%n",
                dateFormat.format(new Date(record.getMillis())),
                record.getLevel(),
                record.getSourceClassName(),
                record.getMessage());
    }
}
