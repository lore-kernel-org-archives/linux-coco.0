Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248ED235C01
	for <linux-coco@lists.linux.dev>; Thu,  2 Oct 2025 22:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759443059; cv=none; b=aaWb9cyXahb3VA5azZ4m6Q6Vn9fTI5kjEEucuECKIZQVEnEB/ivioEPTZTDpI+BxPICKHXn7/atqNT0FRZI8Q3VVU0p56SblTUJ/9ymuT89yD9Ou82uBRMBGbzya4AHEh6xK+CfxCK+8jyLm3z/4hCdKib1fCG23vx6bAsMbJE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759443059; c=relaxed/simple;
	bh=mKG+w488LRTMnm7R955s+DK3kk0hwMmhXGpSGnImgLw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Zhg09/mMBmCsQ8s5sW2fsHvcxgbOgMsCV2OjPJDs4qgSPprWGfQPyzSS79aKdRKgHa8JMp6DPt00BY7cCkhueBjFogaAuizPkKMLpDBvV3iFN1LJtUyKPS5vDR2PCVg77T6c7bFuUkeJYHfR4qVB+997Q6LHnjvzvMCLy4fECEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H0QS3IG+; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H0QS3IG+"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b523fb676efso1406122a12.3
        for <linux-coco@lists.linux.dev>; Thu, 02 Oct 2025 15:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759443056; x=1760047856; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mKG+w488LRTMnm7R955s+DK3kk0hwMmhXGpSGnImgLw=;
        b=H0QS3IG+sZCoStVuwVSTF39/v4joP/tMgUQo54pPKQ3Dx3GrG13icyxY9SFx9luHkT
         mBMV7Zj1DJ6UlBQkAVCsQ/edfBGOD5V+UFh1fSize8A2E6couXzkFwQAEVb3wpCQNQRf
         4rMw1AgpLQGR//UJofj9vGDlxyyhfJDnqlY3HN8Q5k/I8aa0mXY+5pXw5NtVh8h8jBnJ
         jdINKoXT9lh9zPvYOQ4qpzqdFMCPZV0PJdoOj2JRUKFsdSfkXxc4PpxSgd8nTl4OU4BM
         DjOlSYWceZMkbNEENIpgRrb0VaEJUugKbDIud1x1E8WPzrqwSAiiL8YgngZlqzBj0ru2
         s1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759443056; x=1760047856;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mKG+w488LRTMnm7R955s+DK3kk0hwMmhXGpSGnImgLw=;
        b=pyUI4Gj+AZPD1lInVCScBuPLQoDOlQS/DqjqQwpLHUTpUwAe1ZcShObB/42Oac5QnV
         0tLyH03wE3r151kiwf3CuoUSpfb3soJ+nE13hiriC/6SUukQTSlpLa5x2kG2FMJ5lQNy
         IwLaaBnyh3s0IuwnioKG4wDRVNnPGdsx6xd6oqwImqf8MZ/ZfJaGWbkFhNpm7NCEu+Wr
         Op1g7G1oAxe41BpxTLaJl3pakZzrOSFCHKHAKYWwo8hA8Q2YzYc6zFm/aJ04/VMCncr2
         Abe9qX8znqTpNUDOMTmKSTYekvys0iblsCba+Ak4S2KfB06oy2bYWp2PjeDIzmiO3jmx
         zAEQ==
X-Gm-Message-State: AOJu0Yy9SV92Sdlxc2W9lEXbtSIYM2zFHjhpmHgnYW8eqWostakIlMch
	y2yBc3C6GBNCTwR9dswvneW85Hn1Y2ihvDJWD9IA/6dZ6/y1qO9Nd7xJ438lXd+YhxCxTNixwh9
	UWQVY6xAQAV8nfgZAPGRo7guHYgClOElspGn+O9ZAHFhn4+AmeECfFKOPnkw=
X-Gm-Gg: ASbGncv2Zy74HkO4fJhTyBZRDxCjjeu6NweJZk0hfoYpHfdcHI5DREGMp0pLpwaDZPO
	8pfVQbZZZ0D41f1Fo8sO3grMMVjUv30oZe3q/cE+IYOZCU9nfTnTNHRWlEOLu5auDuva7UvSzc0
	/W/Y1K6+jbKZdCan8E8WGc0NxcVWk2D+CPkT2zKCPsyYRABu6eh6MnS1QnckRQnhkZpbCYqmpTT
	K2FReFlUBIqzQ8+vWpYuTGycVYx3+Fjsy79TyLueyG17lX5YZN54BRLs/U6QKyECzOLVPOhdCbx
	sDhnqSo1WDz5QRH2W33X/avFDvv4pmmAd8Q3tmy6DdDWhA==
X-Google-Smtp-Source: AGHT+IEsUUhCJomJVme78wFx/MP4Gt4wBY/+AX7AmhGQX/0Tw5yOX+41oeig2lrNswS/lew6cGR+SYDM9OXmnfa3Glc=
X-Received: by 2002:a17:903:2342:b0:279:daa1:676d with SMTP id
 d9443c01a7336-28e9a5cd675mr7629285ad.8.1759443056002; Thu, 02 Oct 2025
 15:10:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Steve Rutherford <srutherford@google.com>
Date: Thu, 2 Oct 2025 15:10:18 -0700
X-Gm-Features: AS18NWB7AioD5EYFZMO_L6ddBOEiYgBObuqlZqdWYSNYGxASJv1dKoYM04R1EcQ
Message-ID: <CABayD+dZxY_NOX3Ui5PztpaXpXhSBrs9L1arDjw+GoVUVEX9dg@mail.gmail.com>
Subject: CCC Kernel SIG - Thusday, October 9th
To: linux-coco@lists.linux.dev, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Thomas Fossati <thomas.fossati@linaro.org>
Cc: Steven Bellock <sbellock@nvidia.com>, "Williams, Dan J" <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

We have an instance of the CCC Kernel SIG coming up Thursday, October
9th at 9AM PDT (6PM CEST).

Thomas Fossati and Mathieu Poirier proposed an EAT profile for Device
Attestation, which they posted on the linux-coco mailing list several
weeks ago and recently updated. They are going to present it and
solicit feedback at the next meeting.

Please take a look -
https://www.ietf.org/archive/id/draft-poirier-rats-eat-da-02.html

Thanks,
Steve

Agenda - https://docs.google.com/document/d/18D820gyt2xe84Jy6dGXgrNThApoozcekDzvIlK2_bd4/edit?tab=t.0
Zoom link - https://zoom-lfx.platform.linuxfoundation.org/meeting/92401169243?password=e6c02995-6cfb-4f90-82b6-747f767eb168
Calendar - https://confidentialcomputing.io/get-involved/calendar/
