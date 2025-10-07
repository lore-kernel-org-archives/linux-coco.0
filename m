Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AD32550D0
	for <linux-coco@lists.linux.dev>; Tue,  7 Oct 2025 08:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826570; cv=none; b=sNpgiwPFNOYRHf8ClbrlsqUfQO8a3gr0kGFLjVrp0oL0t3BBe18pMiuhvOw5ttpo+G9PEapdS0oGBzdxxFU7wccnLECPpE84x/erhkF+9uakIBb0UG/tSHYbP5WLYNh5eMl7IjkyGSp2wW1Yexe9rS+toXUjD2XBkX7qEn3WDzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826570; c=relaxed/simple;
	bh=G/24lZM079FDhd2eovkp9//95+RNmJ7hr4eXpuqql6Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=USchEPqh7RuA8itJmnZSRPCARy0hJHdiGLQPdaimc5n/4QZqRoDfU0K/D3Tfkt3EczzUF8g1aH2iSJVS28FJH+pRI/aCDCnEDm2Er3ZylgiW5K88FQqF3USyn9gpGUz489nvtsw/HgJbiHTt8bFH3TAD64wqFYm08sj6zNv5pFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gtf2ji47; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gtf2ji47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759826568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=rM5k6sGYa8Pm/22q+hyc5ZKCks8KFIHNUgtUTB38M/E=;
	b=Gtf2ji474gBsnSv2fnN235z6EY4iqiobsFL6U0T0HwTN30NhwPWPFVkPRQE/JFML0Wp0E+
	2vhRji2B1zfk4+PFiCkHvthKBt7m4dXtqaBrQ/rOaR6dSIkFGXn1Dy8299UqNvR7o7Fr3b
	jnpeSaYxpU1YoRSn09OS+B2Wi5DjJLY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-KueAIWtpNrqSpu2EUYD-MA-1; Tue, 07 Oct 2025 04:42:47 -0400
X-MC-Unique: KueAIWtpNrqSpu2EUYD-MA-1
X-Mimecast-MFC-AGG-ID: KueAIWtpNrqSpu2EUYD-MA_1759826566
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-339d5dbf58aso6407535a91.3
        for <linux-coco@lists.linux.dev>; Tue, 07 Oct 2025 01:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759826566; x=1760431366;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rM5k6sGYa8Pm/22q+hyc5ZKCks8KFIHNUgtUTB38M/E=;
        b=YIssYf6ON+0IqhxVSHaRM73MN1SeGGf5NoXLNExqYYDlAZxseQNGW6GvzsC1L5YV2Q
         3D1QfgPY3fb3skpJ7NyO/fePFpXp7w58vkCaNwLs6/4hZmNCbVIvVNnAnMRwlYKj8HLw
         XShpW1iDE7D9Xg1N3QP6WLFqt9Yfr1pEG3u4L7AB+zaXSDsXi4H0VycYDzZ/BEHrS6S3
         HtuXldI8aH+69hE7IR9Ka7yF7jMbxEyXBiI0KF5pZcLE1/snSsIYbG8cdTT+AUjyVT5v
         xeadk3LG+8pe4cz/0X6QiX35pnlTOzUrQOx/SzxxY/d75IlN6qkyzRt8TBwV2m5EJLkA
         tlPA==
X-Forwarded-Encrypted: i=1; AJvYcCWP8Gaywu7o5bZOQCgQmKr8wg/qTUMtxk5CffcQp/n8cY3nbSFoT5eGjZ4YYflKi9pONMULJ8+SCVwL@lists.linux.dev
X-Gm-Message-State: AOJu0YyPjelL8kdoerqro1VFFT4JLZzU3QfZDkvDb5OXwzvcI/ZHlVP8
	9E6KxC7+yjEd4bzeu8aKwob3QDfAxt+zMR87VdIT7G1JVSDCYn3aOwi+OUEtSfV1Lh1pQtfBRX9
	l7bKoS3oAWP8yxKQSbyBx8I4wSXao+t4M2/BPOxY1/das9oqDsrzoDQoVSnskZUwI5oJQ3nE6PL
	sHWImOqHQSk4MtqM2ROlb1x33EVDAi5AxRrFQR4Q==
X-Gm-Gg: ASbGnctEAKEOilcPecnD+WAEKQvt71bmyFXxwubI3bh3cZevFGXzZOqf44xYVtMk5Pk
	9oRSxVqP7l9KKBuXztUFvSpe2NQ7yvMlzP4XNTs8QqgdxA90P/8+mCv2oCB8cM4lxoEy670NxI3
	CycCp+CFPR47LsPFukpq059TCQEQ==
X-Received: by 2002:a17:90b:1b42:b0:336:b211:1772 with SMTP id 98e67ed59e1d1-339c274dcb3mr22203323a91.16.1759826565855;
        Tue, 07 Oct 2025 01:42:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIxP2FOM94heyF41CxaE3rbpyz40M0HHMKBIPWx/387EW9VEGFzqG/VxfDdjJsFBa/6/sN4LKbM/71H6EckRE=
X-Received: by 2002:a17:90b:1b42:b0:336:b211:1772 with SMTP id
 98e67ed59e1d1-339c274dcb3mr22203233a91.16.1759826565165; Tue, 07 Oct 2025
 01:42:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 7 Oct 2025 10:42:28 +0200
X-Gm-Features: AS18NWCOF4XfzLr2dEgmGpxgibs9vZBFWsiA794Su4eLGALamjYeCPyUvJ3fEPQ
Message-ID: <CAGxU2F5MbxjrrT9O3R4hvD=6w6rsYS7DhZ6F9u7HTVSsfc2tkA@mail.gmail.com>
Subject: SVSM Development Call October 8th, 2025
To: coconut-svsm@lists.linux.dev, linux-coco@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XOXYmuQUboeU6T6aMfA-4rEhYmcu64Bw23vPxU16fEg_1759826566
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Here is the usual call for agenda items for this week SVSM development call.
Please send us any agenda items you have in mind or raise them in the meeting.

We will use the LF Zoom instance. Details of the meeting can be found
in our governance repository at:

        https://github.com/coconut-svsm/governance

The link to the COCONUT-SVSM calendar is:

        https://zoom-lfx.platform.linuxfoundation.org/meetings/coconut-svsm?view=week

The meeting will be recorded and the recording eventually published.

See you all there.
Stefano

