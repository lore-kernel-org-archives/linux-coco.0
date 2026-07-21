Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A7246A603
	for <linux-coco@lists.linux.dev>; Tue, 21 Jul 2026 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649570; cv=none; b=Ul2ANjFBc/284cEBvp72jU5YXczR6LzQguvjkEAhjYS+Xxd3638AhyKPdD62sZVPohv2FUQidlB6pR8WwD/ZbOtJf+B9j5VccZYF8/cHiYWpNQ2lCP3x/joIEST9iK5ElWVES5xl/wv5OBNVqlemsnJ3yZ6NMRQleYqO8qf5tsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649570; c=relaxed/simple;
	bh=kQ6MFm1RcBK5lthrtsS3tKwgEUgIjQSVP8M3aj6hNVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ji0Fn4pERE7ldGe400RfsQCpL2yQ8n8PbBJZANJcdY6RETH1myn6mryU0go2JY+IlohqaXe88FwP/3/9Ze+tboKTflMF8dyfD5pMPCxy0bellwbWP8DpBafML/krt19DQaotoq/Ghey+anIimu2Gh+LeadFsKnG0g8q87Gr19lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a0Bz5iwO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a0Bz5iwO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784649568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=coBt7Zb3aZ3ZG0mTYJhcJ0JzfkK/zs88iplrFlJsbyY=;
	b=a0Bz5iwOsdFK1TBWd/HQDuJgFNkUHuxb0o0AykmzX6BFTFeBh1j1w09gyRdcJsC6fDOXYv
	KAsm0D/CRz/t1rI7DyzvNq2wSJUjDrtL7RU1UQM+kBxZWMTie65/d0bPwpiWD58OojCByt
	07l8MJWQTPdOPaKpaFQA84nqCBHeENc=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-EojOQeExOsuTrq4Q3dhNeg-1; Tue, 21 Jul 2026 11:59:27 -0400
X-MC-Unique: EojOQeExOsuTrq4Q3dhNeg-1
X-Mimecast-MFC-AGG-ID: EojOQeExOsuTrq4Q3dhNeg_1784649566
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso9170360a12.1
        for <linux-coco@lists.linux.dev>; Tue, 21 Jul 2026 08:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784649566; x=1785254366;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=coBt7Zb3aZ3ZG0mTYJhcJ0JzfkK/zs88iplrFlJsbyY=;
        b=h0qD8zViTG+ABa3yYqYSro2ZPzYQnTiNbQz0SJTNostBg7E2+vVX4mcMCFfz8Jez5F
         Fl/U17UuDqoAIv9k8mv2bcHJyvD26jukVodfuQ/zMFjQTEBLGSGrcnIBP1w1qsQcj9Dx
         fnPJrRfSm3S7TSyC8ppzzRCVzMvPTw4ngVreSn8sLkbCGmL1HPeyILITJlBLoN9M0KA4
         Ll0qTiXLgqKQfNNiIb3RW9R5R4FN92dniRpPrcop3aaY3XuXx9vCGM0gvpwTxnIXwF+G
         F6GF/VYSKcMg0DhqwRcjr7Gy52QDYcDfWZUfPrnbX6MQI/lLTGmFCeu1PcUV4/L2AxiK
         B6WQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7WAHqEy++VltmyHoP/zXLgXN6rF8Dve2D+MImr2mP1IsWRBPPU3ZmxKk0yXyaYIGVTOrf1CUpdNr8@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6+yga7VY+POb+np4UEdu01AzLWkg81OswR8supLpZAFnoTGTN
	IAyrJaiQWEn4dZ1VgWmh2F3/j+Ym+y5aseCnVKhfRNXfou5vGAaaNQGv/N5pOOpnOHnszYe4U/z
	oYM90892RchqzAbJNiY9+/6UUkCXWGe3AKPxf2lXOLHhEA7ORH3V+E5k010dPk9ESnL4n0JHMgM
	mh4bs3ktzUOPw10H+YbMYMbEql7MF1hYl1NG3Aj99mQHvjgA==
X-Gm-Gg: AR+sD10NdR1qXBS/FNbMgEzRn3XJAUZBMpLZaTT5MRaS+hYYHL+aiy83pKGxMLhLVsg
	jTRhpEmThbM8l1p6+r554yAy4yFKkl0fG65kwZyAL/PgU6ZcQHYlC3kfpzTC37Fy7LmdSHM7JT3
	RxZ7pm913FL3xCXFGARpE4XvZtDUc8uYehOAVe9Ml2wuWJqablxAYim1A=
X-Received: by 2002:a05:6a00:886:b0:847:e4c7:8ca1 with SMTP id d2e1a72fcca58-84c294d4d7cmr20505416b3a.43.1784649565604;
        Tue, 21 Jul 2026 08:59:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:886:b0:847:e4c7:8ca1 with SMTP id
 d2e1a72fcca58-84c294d4d7cmr20505389b3a.43.1784649564955; Tue, 21 Jul 2026
 08:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGxU2F5hP=7pA1rKRvq5sgr0t2y1YoUzYCmH8hzaCS58U4+Y3A@mail.gmail.com>
 <CAGxU2F6ko6Ojyu138cB7szTszoYkx1AEw5oK6EMMaUoi=m7+sw@mail.gmail.com>
In-Reply-To: <CAGxU2F6ko6Ojyu138cB7szTszoYkx1AEw5oK6EMMaUoi=m7+sw@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 21 Jul 2026 17:59:13 +0200
X-Gm-Features: AUfX_mycc19fDRYGIXFAJUJP8E2TJYsiUEBl2zVyI5gpeplWRXhlWTC5mJZQRWI
Message-ID: <CAGxU2F5EtQ7tnF28i3Z3onJYMf30OBCBCz9piTinK013sh+Eig@mail.gmail.com>
Subject: SVSM Development Call July 22nd, 2026
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WMtNJraxJXvLUPTeNIzsQMVYFg2qMqe3elu-VC8XNY0_1784649566
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Here is the call for agenda items for this weeks SVSM development
call. Please send any agenda items you have in mind as a reply to this
email or raise them in the meeting.

We will use the LF Zoom instance. Details of the meeting can be found
in our governance repository at:

        https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

        https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

Regards,
Stefano

