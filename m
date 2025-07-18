Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36DB16DEB3
	for <linux-coco@lists.linux.dev>; Fri, 18 Jul 2025 19:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752867222; cv=none; b=crTT4EkXyWAT0/ROO6YnGH12zoD75Esd9/ZBOXef960733H/WEW1u9UPQxuLCKZyPSh+XQX8d9s1EIJzkrAwKguRZJYvAJVDASoppJ6kcM3T4qN7biGy1/K2qzfCmrmI5LyBGWCXgW2nFK3zUUSt/qzVmjaP3XMsV47equz4PSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752867222; c=relaxed/simple;
	bh=CyvRbhdzl8B7/rjJd4bHIqdDQ2pFuWYnbhUcyD8opa8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fYm8l507iH7FjSCM4Fi3eC7VIJuI4tDLzkPRWWiu/CAjgqkaQ1si5nzq1hRxOEIzN7nOrLOOWngKX90I5ozeOjfURTgKl6/A6nbv63uoOjSN0+i4zA2onAr6gtzgGM84im3U0WNN9E5dpIYjRtJs/YdS+/cSbJA8XYdF8yxkWm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iBZA5MOs; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iBZA5MOs"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso425165166b.0
        for <linux-coco@lists.linux.dev>; Fri, 18 Jul 2025 12:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752867218; x=1753472018; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YnfIHBK1YuvATlD8pswIArS7jif8Levot+TDLWJcJyA=;
        b=iBZA5MOspK/q/O9FZ7zVl3HdBQz8bSrpPA9uQsrQATYBfZ9ftapbuE/JeIwmobw0P2
         aVofeK82LvLw0MXcmFwcUjA3N/Bc5u1HJl7HKS22qGvEkguec7tYO4H6MtkHnMHevnCm
         N32pWRXp5mMyDjGl2naOG+yT2PW1CVZAtyyBdkNtQDEgQ0qubyXbbOClwXWdADNVcBeb
         XgCjW6Rpq3loWeBt9yvRUtKpDx5xstpvjzLrjX1gYJo03wwqTDyQQdhP0yL2tRWCnW3Q
         Nn/kJluoL7eYO/dK5WKXdW1N1/umFyFh/w+i4Hh07WUcvEtocHtqwrjXZvO3fVunD20B
         NJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752867218; x=1753472018;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YnfIHBK1YuvATlD8pswIArS7jif8Levot+TDLWJcJyA=;
        b=aw7KOxYRIb8OwRdog65TiVO3U9CdM+BIARdcYqgCA8KzItddC50CJ5Iu2dHF6UuMIl
         So1RtVdEmMlFZt/Lqxh0McbXLHPOlJdJCiEhFVHkwA7dJF7R3HTXSHjb7krIYbUEKolR
         WtN2lW8w3UHMR1xFL5/J28wDYxpTZEfKN9nRkC+DpJdA7IllV1d9O1yJTdPDFo4L6XPC
         O78apLEc1PEDyRoizfGOi4+o3GI92iP0GHd18wVKakPMqzDjOOVo/vVyVmSCi2OtkFPj
         3FpVXRH4OwWf/vFEDKmrOR5aQg3m5d9hqr1DTLbxZHTEQGUlXxl3NSlUUdZZS4+Cv7gT
         Fkgw==
X-Gm-Message-State: AOJu0Yw/mPTOfYJQcqO72ApoyEfA7jIxsb0xzAYgT2BgdHYKrzjb1C62
	B0hW/L4h7LregEv3Q0KxLjCS6sRfvcRkkPdlhLyV8mYN40vwFkf3r7HGZj3kPJPlBjdukvonXvv
	shuFxLth2ZxTNBujCv+h51AYIOL+9o7DEh+dNL9LFoffCqTm7u5dqOn/XFw==
X-Gm-Gg: ASbGnctiEUREvEGK7EYGtFivl7ioUM2HFX5KIj28bJOCnmBistE1dTtEelXcl7n60vh
	IFNCXyMsg6KUPNgZmKA+9JHAsnXin0yhknfOh2ag7cnkszuB2eJVnJhWAy21vOQLjB7kA5xI7cy
	VRsNPIs07YOp1r19tmF1LB0L8nMARbXD0Y5gUdqMQlHko3vHkpzOxhx1uQ6lWzc4FfKdtzyzcwx
	x0+Cy8TYMnhryAimi7BzbGfzHrjPH+JHd3gsK0DnJpIXwKB2pwc
X-Google-Smtp-Source: AGHT+IHYta+rNi07yEXoPDhqcIxRkacQwgcQZnTC+LhIIF9TSXYGJ4vgr4CXdnLfCcFjLGOn2ER/TYZB0GsvQ0Bkepw=
X-Received: by 2002:a17:907:9450:b0:ae0:c1c4:645 with SMTP id
 a640c23a62f3a-aec6601c509mr443385366b.21.1752867218403; Fri, 18 Jul 2025
 12:33:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 18 Jul 2025 13:33:27 -0600
X-Gm-Features: Ac12FXxGt-REKhyWfj7dUCewekcP1SwvSvdpI7PJpb8xmhjREdmGVYZhISYEbgg
Message-ID: <CANLsYkwPAFm6L1SvfDFvH+fUcNV775Xop2zmOm-ufWrDWCGEZQ@mail.gmail.com>
Subject: EAT Profile for Device Attestation
To: linux-coco@lists.linux.dev
Cc: Thomas Fossati <thomas.fossati@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

There have already been some discussions on presenting SPDM
certificates and measurements to user space [1][2] but to the best of
my knowledge, a standard representation of that information for
attestation by an external verifier does not exist.

The work presented in [3] is a proposal aiming to address that by
defining an Evidence claims format that is generic, extensible and
architecture agnostic.  The definition supports SPDM-compliant and
legacy PCIe devices, with room for any number of expansions to
accommodate other bus and protocols as they emerge.  The current
proposal targets device assignment for TEEs but can also be used in a
CMA-SPDM context.  The EAT presented in [3] can be used in a
stand-alone way or embedded in a platform token as needed.

I was hoping to discuss this at the KVM forum but my proposal was not
accepted.  Since Plumbers is 5 months away I decided to start the
conversation on this mailing list.

Best regards,
Mathieu

[1]. https://lpc.events/event/18/contributions/1955/attachments/1396/3026/PCI_Authentication_Slides.pdf
[2]. https://lore.kernel.org/all/cover.1719771133.git.lukas@wunner.de/
[3]. https://datatracker.ietf.org/doc/html/draft-poirier-rats-eat-da
