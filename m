Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D196315688C
	for <linux-coco@lists.linux.dev>; Fri, 22 Nov 2024 06:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732256529; cv=none; b=JKuFINjtSvBVWzvZm32uU6M9fUJd9hEyY/M0DLgRq2NC4ABDxUB5SSFLUq/jBtsS753m6YGVNTjBh/aNCmN+QQa+L0m6rUlFH1Tm+ErXvj3u29LLgWzHXUUsJlmhsBQXbuwJT7Ib2JO/W1N3i7Q6wGnQ5nkLNyM3E9FSGlw4mY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732256529; c=relaxed/simple;
	bh=3b3x9SHqZdhjEOvi47co7balyY1lHyFtH0a42xkfoHM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=oLw8pUbmKCHZeQTLko6kIPifSdJOtzFzsZF7wv4aU97MzBxCz30aQjcRjs2evWnIwdTmdR9+wwlchAuG88vMd/VZJX1ssj+i8ry9rRGX2GBcUJXWn02ZkcztcPXnWUu3fnapDDQikH7L88hqUWsBh3N+jVvWSpiC9bHbRvzbcCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l6hGmDlU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l6hGmDlU"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so14948185e9.3
        for <linux-coco@lists.linux.dev>; Thu, 21 Nov 2024 22:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732256525; x=1732861325; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3b3x9SHqZdhjEOvi47co7balyY1lHyFtH0a42xkfoHM=;
        b=l6hGmDlUeTI3nEuZnwSVvI90uGoMJ1YpcVIO2XfYRFLldOsPUQcFQ3nvqhZaB0y3bx
         Qs8qOmeAwS3+rcMBuWh84z9zZi22LfJ1G1x7UrwxqZL9ZB3c21sIz9iGA6yuvz+dZTlE
         uHcZE/ytYQ+iJWYBR4iIjTWjj8EpxF8QjzpVtPv3L9VES7XaTvu/edd0dnGU/HZLqg4y
         JSimocMhlkcxXEZFkFkHYiD/7c0uzD3/llltQKPYMK9TQsQirkC8b49qur4HdHYMeUcb
         9ShAQ74qUQG9rkt1Eih6RoIIRLNrA/AJztYSbOY41ruIC1/rPq+ea4Sj7F/FC3MzkECs
         ZaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732256525; x=1732861325;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3b3x9SHqZdhjEOvi47co7balyY1lHyFtH0a42xkfoHM=;
        b=B6nJKCcVmCV4Q4/+wXMQzjFIpY3/ytQ9BWv7mtvfiPe1F1xuZ6UQ/Z38AJQ5/Ivzvq
         PpM44gW72tw0E5QxbqIDMFcHG9DW8P83/QBLRg6eu7uk/SIURDzmb/DL9Om5dohsMkf5
         0R0sC9zP0wQ6+7LNR0PaWVkh+qbU4Tu5VWaQInB3npB2Y5H94aV5OJ0qiD7eagbBPd1f
         uFEQoVJOfSK3VeA+GCADLAdUcPjlixQVwO6ipua750hpHvS/2DQPaj1s/u7Aq9gIpogN
         F5OJxaD7qPS1DRd8RumLEPMaL4K7Rvsp4gKQpmkcpXi7BfQzQRyqLXeg+hlz6PmCM7Q1
         FduA==
X-Gm-Message-State: AOJu0YwLZ2wm4xc0twIDOMsMxZzPcC7GoBOyImMdTEGFYqK2S3JyckbW
	SSOqee/iL9H0YolLlO//RXZ4t7hZMZH4VbJl+oD8V+J6jj9pH7cBDt2ARUfnzK7fIpPDzIigz1X
	tHGlwQFqj34TG6UKxf8KtKCtSOtHBZ27GZF5WWid4MU6Pn4L3NfPtRM8=
X-Gm-Gg: ASbGnctq/yYXB5LtqNOcFUSueB/TBaD1a01xBkcmuAwhYxbgfbrjlShSQl7WQZdRwEy
	072YH5wbJLYGELI4nC1+C8OgrHWuu0Uw=
X-Google-Smtp-Source: AGHT+IH78CiHUHEdnMn81+pfyFhrn9/drKr+c4H799SB1tR3YOm7KrvybxHLvwOH/C3ySxGBukf+PUKj2/3lSfwVRaY=
X-Received: by 2002:a5d:5f8c:0:b0:382:47d0:64b1 with SMTP id
 ffacd0b85a97d-38260b4f71fmr1341009f8f.2.1732256525197; Thu, 21 Nov 2024
 22:22:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Steve Rutherford <srutherford@google.com>
Date: Thu, 21 Nov 2024 22:21:28 -0800
Message-ID: <CABayD+diXYPnm87ZjyW_C71qC1sS7nnLeVek+T=HyHkMmRWAdg@mail.gmail.com>
Subject: [Cancelled] Confidential Computing Kernel SIG 2024-11-22
To: linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

Given that we don't have any explicit agenda items (and given that Dan
Williams is out) for Friday's call, let's cancel. See you all in two
weeks!

--Steve
