Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D77199931
	for <linux-coco@lists.linux.dev>; Wed, 10 Sep 2025 23:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757547488; cv=none; b=U4CS3TVJYYpaKa4XuXxVbrBbxXaj+QtE9+f+0gHmuv4T3fq/hKumObrsJ0rL1wGxUfOurKUuTX4F69maquI8QUjoEzkLKqblrt0DeMMrlfLHo9I9yCcdbo+4Rno0y09OjrxTEMPNDWxP2XiI9JyXgdapA0oNBGoKAqjU9OzaLbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757547488; c=relaxed/simple;
	bh=0GDnUeoS21hFFZoNsGefi+6ZURiVpYOqOj/XOeTs5VM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=rAdRQ6wviG/Dn5Byl36ExmQdUlG+xeYvp5xQCIg+zsA3qqbwVAe95Xt8lWW7x1p75q9oYdCk+i6ny09yLLrtVvdQ4DrQOIE5F38dfGODmtDluTj6kFeD10b27cZ4f5PaKiI4gEnlR9WXwLaC3V+TLxppppKlI76ff1iPVvaFyBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G6dZMENQ; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G6dZMENQ"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-89a079e029bso52298241.1
        for <linux-coco@lists.linux.dev>; Wed, 10 Sep 2025 16:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757547485; x=1758152285; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0GDnUeoS21hFFZoNsGefi+6ZURiVpYOqOj/XOeTs5VM=;
        b=G6dZMENQPjx8wEbFCKK0HsHGDSudQWkg+Ce0/J5cqRh0kpiEku0gInlNNUDkAOkXSS
         CQDGi/1Vq0X+xhMRFuKIQ8truGv6449tvnU6nF+6JvnwTrRrvYfvsCrjgNvYGdFAuN3i
         GCh6S7vpCVpIJtNoZlf9c8izkZwH1U0YFenVy52PHmD5Jm7r2OPd/lUrTvOs8ssgkuTK
         IHxl/6ehp7tHMIKAUQQ9y8O1SKVKDHgzeAT1CClyGmw03BN982fdV47+pG6L3bc1Dm+o
         ni57IWcBRY6UMzhSUBQEPNKZmx999SaG8j42eG4ZPyTBVz5xhH5AcS3pPkCwOkLFh7CC
         YsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757547485; x=1758152285;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0GDnUeoS21hFFZoNsGefi+6ZURiVpYOqOj/XOeTs5VM=;
        b=oD7Kbbbh2tz1fJkBjGIg9+QOQxP3ktoO/wWFArUpScl99b/mZ3xtPnpp2UT61Yr3dY
         jSiUlGxNFt2UiZEkFHQqnnr1hGnC2QhABeCy6I54s8ssMhh0n7noyqP/AVN9JYCUei6U
         ywymQPvdSIwzVwpDhr0QOGQgOXT/vJrhimUZb+j6OhHrDYW8DTKeKPLnhfS7rT16bk7t
         v3aqbWesVw9B9P2IFRBgWxDNWa+rmvzT8j+vKmcipu0nsN6skPHlSApywnnfHiROyiqY
         5dwxe2YGNqIpAuYNWcknScCW+r8fcEfd9EYq+caH2XLPmbzDwJ8FUUISRFlmcB0ZbsaY
         K2hQ==
X-Gm-Message-State: AOJu0YyLxuso4YZ3YOt+kOS55vUAjJq5p/oRh2JY7zoOkUvA37QJoLVx
	81H/dHNLYZH+Zm93pq2jDHQkkqGJGz9X+tQSubt1/daJyK170lE6uhL/jZZiBXDvfyOjFBTkwxm
	bIM/bndj9xr2mVFYcn4RdQRyLGkpokXdsXZHzivvKY4yDVBpNr3sROyex
X-Gm-Gg: ASbGncvIbmDOLaZsYbuOzez5L3a37jgOGpwIy1QJpwjroLCHJ26PKMpWQJHjSdp/ztY
	2f5BliRPB5vJpT5FX7quLC8uTK+cI0m4F/Q7/sjN8INa2Wwjp0o6V9WxPLEiMEsIpdpFfWDc8bF
	LHkvJFdtWrkuhUV6XnlPd7Nwd+LEF6cdlGBVt7vGz/MhZf7DNHIlMWG1uNJRvL8v62vG3NyPuRb
	nvVSuUBGicziIkE47H0PbSL7tdhzhx4b30TLhg45qyp
X-Google-Smtp-Source: AGHT+IGPfB5zkBtRtYPNlHPE1rN1eStEKPcZ3tqQteJRCRXt/7srgBDREkk46orI3hhZezm/M/gYtjeoi8D3vqj1aKc=
X-Received: by 2002:a05:6102:944:b0:529:ee6c:6760 with SMTP id
 ada2fe7eead31-53d0d61de0dmr5583274137.7.1757547484857; Wed, 10 Sep 2025
 16:38:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Steve Rutherford <srutherford@google.com>
Date: Wed, 10 Sep 2025 16:37:28 -0700
X-Gm-Features: AS18NWDDZa3EddRzZc0li5aqnuCqGkqQalqu8T_aeLNWyb_4ZrMXFWKyuaBj3vE
Message-ID: <CABayD+dg_p6ZeQ8M=ETix1d8dYGK8rdY7WFr14=uZ6Q18_UNEA@mail.gmail.com>
Subject: [Cancelled] CCC Kernel SIG Cancelled September 11th
To: linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

Cancelling this September's instance of the CCC Kernel SIG due to lack
of agenda.

I believe Dan's VFIO/IOMMUFD huddle is still on at 8PM PDT.

Thanks,
Steve
