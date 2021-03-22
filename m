Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE545F
	for <linux-coco@lists.linux.dev>; Mon, 22 Mar 2021 21:35:48 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id j17so9401704qvo.13
        for <linux-coco@lists.linux.dev>; Mon, 22 Mar 2021 14:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=s7grtCkX7DKhOXuOtCYVfYQ7dhHtAiix1eK5L5X2R+I=;
        b=XS24Bu/c39iqddMd82uSYeI3Qn6xlgMoyj1MoMZFB2svp32SL8VsrgckwjEQ6jYGzt
         iOlJSu6BxjxfKqoTvpPxtaT7eDzlOi3Y1446HwN7VLC8gZfPSLZaL51PczR20Z6n9N/i
         /o5TMDbEdBNdkpHaW9/WP8C84jOcZMUe2EaYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=s7grtCkX7DKhOXuOtCYVfYQ7dhHtAiix1eK5L5X2R+I=;
        b=bt+WiEzOsg4LoyT8wQtYmjG9LN1CoT7LvhSO0xTI9iqBCJSQhAjOJKTIm3mwJFEkn1
         zH49fUeqYnFC2wyNb7o0GBlPIU5Ll7nLV5Zo0jiKo9grVqkMCtMLGGBJwrsNAVshxU85
         7YYxZoXYR9DojCKpFuRhZhbWNw825vP5dc1dnPFrg2olbGh92KNwV92aheAxvJU+cTFK
         EggPI9IukdxjOFXDWDEjLF4apiHi/j1A8gA4cvsjP926AVhtaMiR5MoBqnxvnHHEDDBM
         nmsr5jN8WnEBKCNvO5cYgsZ1pEf/DHLVpAloTM86Rf8pCfgjTmJKQanUMBvATz3Kw9EA
         JQkA==
X-Gm-Message-State: AOAM531gwxt9hJ9xkV6IhMqeQelITSJuiE8AmBL3vpz7QY2M35x2laiL
	qoS323RS60RJE4Xuto8xguMYNAPRgXpeVOTRiz/l8FUtyoHX+vuX
X-Google-Smtp-Source: ABdhPJxwF65dJMs7dmj/2W+M4Eu4ppTZgKrUrtk5BTIz/2F1knjyONgJo/g2zWL9LeBEXcl+bon6c+M1FrbGKVpz1CE=
X-Received: by 2002:a05:6214:1424:: with SMTP id o4mr1827425qvx.34.1616448947574;
 Mon, 22 Mar 2021 14:35:47 -0700 (PDT)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Mon, 22 Mar 2021 17:35:37 -0400
Message-ID: <CAMwyc-RcB5YvjkW8QDj7gB46LVrXvgECrxHmc0rfX6nmyNsx+Q@mail.gmail.com>
Subject: Initial message to start the archive
To: linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello world.

-K
