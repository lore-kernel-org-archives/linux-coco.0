Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F087DA82
	for <linux-coco@lists.linux.dev>; Wed, 11 Jun 2025 21:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749678677; cv=none; b=d/nOgEHGbYWDaVKC656QuoulV2xHjnN2Go2hXoJWBL5fYU5x9MlNI6nfcz4BjElXdYNXDx0NWIGCJAeIHyMpLzgln/sjOlIrBak2uHHrudWDn77yqWI9dUeZfGwvgKTBXhpPR7L0B2wtVrBFHC0VEJpRFwtWmt5KKi+7p1nAEQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749678677; c=relaxed/simple;
	bh=2X93JK9ZPiodTzj45SRXlzv/noteKCRUbZLhBvTGPjs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=IEGdTVgjJlZQBXn6yOymVhSwpZGPb+4cGUZqAQvyG0GuD4/YmZRxJucnK8KYxHxBuJ4YvtNNSeIcm5h2a3NOmlByPOXSmTw7Ytp3jcdrOtf2lHpvuhTnP4+N92N+MWE86Nk/OquxIFqXOQAbzJlrI4Cm90LzoamkD/IeLmzIf6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jXPB6TMp; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jXPB6TMp"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4e7b397cc2aso78195137.2
        for <linux-coco@lists.linux.dev>; Wed, 11 Jun 2025 14:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749678674; x=1750283474; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2X93JK9ZPiodTzj45SRXlzv/noteKCRUbZLhBvTGPjs=;
        b=jXPB6TMpbVUgo9eSdBfQXgB6FZ7LsyEOXU5r9W01vsfZPmMu2YMYBO6VAzV3UAvhfd
         jeal96Jp/OPHkSU2NVO8doY5Qn3NVgbo5NMuZMOo35lArjtPEHtMynk/rmp/BcQXxPyv
         k7uZ0gPWgxQhLUgruCOopbBmxPEYneo8P4WuZIQpUL4nSikXfttNKh7vxkOe6EshVxG9
         wf6nuNwMXZ8AuCprAm9Zjsq1HcynWXIGQ3jGj8DciJ2OeEfHJsBIZBjFn2Q2U5tBbQr4
         qoT3HMsea77qCJMu1IM1hCKGbKoYsf44K+9mHKo+nsysYE7haUCcYt4vKdFIhB6mBaFr
         3brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749678674; x=1750283474;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2X93JK9ZPiodTzj45SRXlzv/noteKCRUbZLhBvTGPjs=;
        b=M/O8RE5IhVIaBpyrLdvVgRMn3ryMPY0TmHvDM1psDsCj8bwGlG7DmOQflDO40doKY7
         DCdyOR5YvtA0E5+ns/yqKQgXLUJ+DON+V3vcW87TMtEXTcRAVTOXRCaQCcErskjdfVMK
         f4Cr8JXoYkb8KC8rNVRBG27DLbcxSPslGjzmeVedWs0nnxlv4zI9hSfHcBczAR9PbyL7
         42qebPRGrhljKAOvnoPLck400f+ayMoGQJAR97b3EqPcb/Z8wfJE8Zy0kJskglFbo2Hn
         1n8jyfuroygJOf3lo1uoR2u5782LMoBbHaR2a6b4ed+FLR3xgcBNY3onp7bENGQkIRBi
         3f+g==
X-Gm-Message-State: AOJu0YyI5PNB2LWv+k74sF/x1qTCQlLWRMPNyomWo8fygUR4eZrLIj+A
	3pxFgG8yUakkqaC3+g99ZsRHG1gbCWr4Sb3J3HDr7l0BTcsRbqtS6W2zTMEEIZt6k4yY5bZzMkV
	m8UDnnOhuVQ0ZgdxjxacJJ+XGiKwH66vJKZ4KLKITigIMvo3Z7wh+Z2c9V0I=
X-Gm-Gg: ASbGncvQydfGqsIgJec8sTvtLSkGnNkMZEuyCZeFHvOjAPgt6OBlbSXcx8EGsd8r4Re
	HNC0dwapyAKheybLfFfOc4Qe5B7190jTf+W4ukRfrVnTxVEEev0XosPzHlxDR+xhgMqX7BhVxlW
	HvizrJbbyYMbhTgPJp0MFCMEZsYqXkZ5xjwkz7D29MFLe0QztYlhyS+9YRlVTgmufjwsc3RxLf
X-Google-Smtp-Source: AGHT+IGMwrLy7hVxkM49GPYQNhFNx8b4PO37V0+LaFBQvbld1IIac69yY99LVyoYq8Q2bqgfPCxY2pcL9dYF8RFT3KM=
X-Received: by 2002:a05:6102:162c:b0:4e7:3efd:ac76 with SMTP id
 ada2fe7eead31-4e7ccbc4d5fmr1968430137.8.1749678674261; Wed, 11 Jun 2025
 14:51:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Steve Rutherford <srutherford@google.com>
Date: Wed, 11 Jun 2025 14:50:38 -0700
X-Gm-Features: AX0GCFukLsub5b-ZPLdFik3z7x6i5lsarhM6-TfhQduesxLfardQHWhYfvbjFdk
Message-ID: <CABayD+cxsR_DS9iB10KG4mKFiRiRaY4srpBsTO+0teWrdk4VJg@mail.gmail.com>
Subject: [Cancelled] CCC Kernel SIG Thursday, June 12th
To: linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

No topics are currently on the agenda, so this instance is cancelled!
See you all in a month.

Thanks,
Steve
