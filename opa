import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.BoxScope
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.blur
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.painter.Painter
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

private val CardTop = Color(0xFF273269)
private val CardBottom = Color(0xFF171E45)
private val CardStroke = Color.White.copy(alpha = 0.06f)

private val BadgeOuter = Color(0xFF66F0FF)
private val BadgeStroke = Color(0xFF97F7FF)
private val BadgeGlow = Color(0xFF4FE7FF)

@Composable
fun MomentumChartContainer(
    modifier: Modifier = Modifier,
    badgePainter: Painter,
    minuteLabel: String = "15'",
    cardHeight: androidx.compose.ui.unit.Dp = 260.dp,
    badgeSize: androidx.compose.ui.unit.Dp = 56.dp,
    contentPadding: PaddingValues = PaddingValues(
        start = 14.dp,
        top = 34.dp,
        end = 14.dp,
        bottom = 14.dp
    ),
    content: @Composable BoxScope.() -> Unit
) {
    Box(
        modifier = modifier
            .fillMaxWidth()
            .height(cardHeight + 24.dp)
    ) {
        Box(
            modifier = Modifier
                .align(Alignment.BottomStart)
                .fillMaxWidth()
                .height(cardHeight)
                .clip(RoundedCornerShape(24.dp))
                .background(
                    Brush.verticalGradient(
                        listOf(CardTop, CardBottom)
                    )
                )
                .border(
                    width = 1.dp,
                    color = CardStroke,
                    shape = RoundedCornerShape(24.dp)
                )
        ) {
            content()
        }

        Box(
            modifier = Modifier
                .align(Alignment.TopStart)
                .padding(start = 18.dp, top = 2.dp)
        ) {
            Box(
                modifier = Modifier
                    .size(badgeSize + 8.dp)
                    .blur(10.dp)
                    .background(BadgeGlow.copy(alpha = 0.22f), CircleShape)
            )

            Box(
                modifier = Modifier
                    .size(badgeSize)
                    .shadow(
                        elevation = 12.dp,
                        shape = CircleShape,
                        clip = false
                    )
                    .background(BadgeOuter, CircleShape)
                    .border(2.dp, BadgeStroke, CircleShape),
                contentAlignment = Alignment.Center
            ) {
                Image(
                    painter = badgePainter,
                    contentDescription = null,
                    modifier = Modifier
                        .size(badgeSize - 14.dp)
                        .clip(CircleShape)
                )
            }
        }

        Text(
            text = minuteLabel,
            color = Color.White,
            fontSize = 28.sp,
            fontWeight = FontWeight.ExtraBold,
            modifier = Modifier
                .align(Alignment.TopStart)
                .padding(start = 110.dp, top = 46.dp)
        )

        Box(
            modifier = Modifier
                .align(Alignment.BottomStart)
                .fillMaxWidth()
                .height(cardHeight)
                .padding(contentPadding)
        ) {
            content()
        }
    }
}


@Composable
fun MomentumScreen(
    badgePainter: Painter
) {
    MomentumChartContainer(
        badgePainter = badgePainter,
        minuteLabel = "15'"
    ) {
        // Put only your chart here
        Box(
            modifier = Modifier
                .fillMaxSize()
                .clip(RoundedCornerShape(18.dp))
                .background(Color(0xFF1C234D))
        ) {
            // Canvas / chart content
        }
    }
}


@Composable
fun MomentumChartContainer(
    modifier: Modifier = Modifier,
    badgePainter: Painter,
    minuteLabel: String = "15'",
    cardHeight: androidx.compose.ui.unit.Dp = 260.dp,
    badgeSize: androidx.compose.ui.unit.Dp = 56.dp,
    contentPadding: PaddingValues = PaddingValues(
        start = 14.dp,
        top = 34.dp,
        end = 14.dp,
        bottom = 14.dp
    ),
    content: @Composable BoxScope.() -> Unit
) {
    Box(
        modifier = modifier
            .fillMaxWidth()
            .height(cardHeight + 24.dp)
    ) {
        Box(
            modifier = Modifier
                .align(Alignment.BottomStart)
                .fillMaxWidth()
                .height(cardHeight)
                .clip(RoundedCornerShape(24.dp))
                .background(
                    Brush.verticalGradient(
                        listOf(CardTop, CardBottom)
                    )
                )
                .border(
                    width = 1.dp,
                    color = CardStroke,
                    shape = RoundedCornerShape(24.dp)
                )
        )

        Box(
            modifier = Modifier
                .align(Alignment.TopStart)
                .padding(start = 18.dp, top = 2.dp)
        ) {
            Box(
                modifier = Modifier
                    .size(badgeSize + 8.dp)
                    .blur(10.dp)
                    .background(BadgeGlow.copy(alpha = 0.22f), CircleShape)
            )

            Box(
                modifier = Modifier
                    .size(badgeSize)
                    .shadow(12.dp, CircleShape, clip = false)
                    .background(BadgeOuter, CircleShape)
                    .border(2.dp, BadgeStroke, CircleShape),
                contentAlignment = Alignment.Center
            ) {
                Image(
                    painter = badgePainter,
                    contentDescription = null,
                    modifier = Modifier
                        .size(badgeSize - 14.dp)
                        .clip(CircleShape)
                )
            }
        }

        Text(
            text = minuteLabel,
            color = Color.White,
            fontSize = 28.sp,
            fontWeight = FontWeight.ExtraBold,
            modifier = Modifier
                .align(Alignment.TopStart)
                .padding(start = 110.dp, top = 46.dp)
        )

        Box(
            modifier = Modifier
                .align(Alignment.BottomStart)
                .fillMaxWidth()
                .height(cardHeight)
                .padding(contentPadding),
            content = content
        )
    }
}