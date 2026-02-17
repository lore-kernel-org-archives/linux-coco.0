Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C83A36CE1B
	for <linux-coco@lists.linux.dev>; Tue, 17 Feb 2026 15:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771341198; cv=none; b=br6tzFOiPHIA5D7tZmopHT5OoVP4vE2XGwjhAijkE0zP6JJCQbv+eV0jZ+qVWDJofhhCcscipsVNcfDyWgeEDVNrmYPdtwhT4iMoxiV2Yn4sZZMg5zEXj8zx+Fi16DmDiN0/eCImOQ+FS5nLLMf1H9dXOUng3ncA7z0a79JsHdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771341198; c=relaxed/simple;
	bh=x7Jhsu7riKN4ta1ryX5N4I7XT9zPxImuZI9ZDeN9mTw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=quUrOOeDDcA3KI5U6GX3TBqquI0Sg0jKkf9/TZVscOOvsdRqHA/Dc1tsV0wbymhRneC96KvUfY+GjP9KIR3QzOP35hOvueCx6EdrKUCBpXECjr/wFnaDma1XTLT0Lerz5S4FNxZFcDh+sCv2OlTc/IKgOU7n0pEU4UlbVr9blv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gjyqwkas; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gjyqwkas"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771341195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=y/WbQo1ubRSbNIyu57pwb3Zf13D/n/SuzWSZhnLxsFY=;
	b=gjyqwkas2zu9M4E1Ucy6RtTMZ313kk52LOrzvPzqmpWVxp606o5xByLjG3f1ZLl6dyNaeG
	k5JTl/FcQEtgfCg63n6LSKWYkKmmlRwaYqasOjDEs9QYwos4jsoe/N+XF+wIZ1F+LTBXn9
	zNRU1C0eTOtBss8r/4XEdPqYRfIAGJE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-J_UDO0P5M9CRZsVpt-tinQ-1; Tue, 17 Feb 2026 10:13:13 -0500
X-MC-Unique: J_UDO0P5M9CRZsVpt-tinQ-1
X-Mimecast-MFC-AGG-ID: J_UDO0P5M9CRZsVpt-tinQ_1771341192
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4837b7903f3so36744015e9.2
        for <linux-coco@lists.linux.dev>; Tue, 17 Feb 2026 07:13:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771341192; x=1771945992;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/WbQo1ubRSbNIyu57pwb3Zf13D/n/SuzWSZhnLxsFY=;
        b=foap3s8vRvWIGh8exZIboOXfgYtdbdyq2GqUfNqAJdXB5T/jL9uIYYBNx/+SYBeCe5
         070hSVCJS0o21xgnEE+Nks3a0IyYJTpZRKy1vd+43y6P9ij9x2NbDmP9M2W6RNWNWHbj
         ke8TFDRaUeBzCXA7hYKcz+HatT0GnslIejDRtLA87VIBGs7/PkT32Akh41qYrRcxQWBH
         uUX5Ff8LIkpxTrYdkXO9o0PrTLCW2aeNsfmZD0PMhKtDcOxyiKHi6WyiOPL42dlniKSh
         BS5Tq6OLXtzCV1+AHIgeBVzubDUoOaweot3vRj6QzzQlvnNv5F5W+82PYptz69tTqqlk
         jdIw==
X-Forwarded-Encrypted: i=1; AJvYcCUVwWLLvFZN3eeGip2zacOvqGcZOOkgfTOTU0zS0Rz7cttHag9xG26Y80Fn1c2MYAEYq72dzkECByVc@lists.linux.dev
X-Gm-Message-State: AOJu0YwiIqQrSCbdc3wpkGROhRfEK354YiyP/tQJA+Lx1x1n/pWe99bL
	qV6Odr60bzOTurp+Q4GAozBJX6xVjHjcmmtK/xPaV7Rjn/7tAxlH1h7zvHx5ZxDYfVc16E5PQN8
	LHLyA0mN3ZgTNGmwgglbcAD4zn1iqNy1ilrVhfDwmr6cG7FMm863KdC/bWuWJcCE=
X-Gm-Gg: AZuq6aIus8XIJw3nCThsviV5blgPBynPFWbTs2pA6KdZkwzCjIZKfbkyO6C9J4TT+rx
	uXHUJZc/+ohcS7R+Q+/mZwMdE2MSEX8nXXaXi+pTxnNKstb4YMpzr6++F+GaZcHDJJfavrOPITU
	0Ho8gqHBmKPlQ4+qZpRgGgV4xZmaiOpJM54xnviwy/GFPZUyDE8tTyvY05yGU23NkhnjRZnRJHy
	SJ5XURJRsX2OGXm4ni9KhLkadMZXqNUcYDZrwGyNZp4uw9jsuBaR710yHOVBiFeiQlQr8fj9Uc5
	dwgW7QRR/K0NkmgY8wtykvUUpnQbxFjRp7ELOylJllY2RzGFfSxcwzac2HvZE2zS7s5/vmp2Yae
	wZKfhaIQerj8TXlmaeimTY8wfxg0AV4JVYueI5Pg3HAGdGGy6HZdWtHbCvGCo2MB9BqLr8Xw=
X-Received: by 2002:a05:600c:1c22:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-48373a786f3mr262279565e9.33.1771341192309;
        Tue, 17 Feb 2026 07:13:12 -0800 (PST)
X-Received: by 2002:a05:600c:1c22:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-48373a786f3mr262278965e9.33.1771341191676;
        Tue, 17 Feb 2026 07:13:11 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-58.retail.telecomitalia.it. [82.53.134.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acf5b9sm32899940f8f.34.2026.02.17.07.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 07:13:11 -0800 (PST)
Date: Tue, 17 Feb 2026 16:13:04 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
Subject: SVSM Development Call February 18, 2026
Message-ID: <aZSE8XXPM5NK91rd@sgarzare-redhat>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J5fu7uTUnNl6KbIWqpeuXOLV_0_u8IN__HPVtGrZ1No_1771341192
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hi,

Here is the call for agenda items for this week SVSM development call.
Please send any agenda items you have in mind as a reply to this email 
or raise them in the meeting.

We will use the LF Zoom instance. Details of the meeting can be found in 
our governance repository at:

     https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

     https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Ciao,
Stefano

