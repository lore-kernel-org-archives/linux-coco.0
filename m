Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCD622D4F9
	for <linux-coco@lists.linux.dev>; Fri, 21 Mar 2025 21:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742591629; cv=none; b=UK+7DMHVIGpEwjfIPClzzfkg7u3EICX4gB+mrHFZmldd/pZbmnaUeDeH2ViF3i12hysAnmj/0Y+qSwmBBTY/q/x6UaAJw3XBJmPxJqTYaBQ61N0vutdAvKdrLOdNlubzCQ0LAHU0KY9tqEsuLks6J/dUrno4CGAEmXXeaD+BK0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742591629; c=relaxed/simple;
	bh=vXCTGBNTu1ZhVw/3Q0kYcVmj5r+C9dLc8FPhH6o66uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BxxBaanXWZae0LYMPabsB/k0lKwcIO6XfY4CyrXQm/eapO2nNtuYe+VLx0CYiiAa9qIACCo0CaMn7VRTZZqMkh9E56ElTEpDnHFfT1bOohsGrPp2Toa6LjmwA7eUQhOBCU7+fwoRpMajhEjLF5zzl+onVVncmYnDXpgOPVFkkE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=JTu4zGVO; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="JTu4zGVO"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6fed0620395so21553757b3.3
        for <linux-coco@lists.linux.dev>; Fri, 21 Mar 2025 14:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1742591626; x=1743196426; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3i2ew2LYxgleBNPrPHWYUPReaCgmTl0BEjHG0XlfsxM=;
        b=JTu4zGVO6lmWKQOqGBc7GyP6K3x3SJHzMTWVafYRiJ2ZSUVYu2PaZzTnJdi/VJS8sB
         S8ulSvfT8NfgvsZQP1rNIk4y+KK6xfxl1qUvYvpNcQCdGYSCjTtR4OxLj4F0mkVXPm7m
         w6YT6vHK6MAyoorYSlAO98/rQZpFz1JG5/vPXcxVFBJ3D6a0/2QZYkjfvBJI2KIPbRXB
         O0lQFiqNVIDLOL3nmK3MsG4fLGYqE38j3RspCTUipRFvhBuAuyd5gYxiYpcxfiQ7r91B
         7W1BaKRJpvm2kOv5TuB+m6cLflA6dwXtT2aR6vssAq3WX9Ud7BEtx1CoRHwEmKEjc9yv
         ck7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742591626; x=1743196426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3i2ew2LYxgleBNPrPHWYUPReaCgmTl0BEjHG0XlfsxM=;
        b=VtP8X/sH8oemfA1/IYtdFcu2yqk5j5SY6Y3Vy7Uq2EP40qQ7lR0wNgTJo5wKwbKbhI
         e7RAlmaGLkq/LPMD7BO+D8fCSe6u5paZujf4H9r3pfshOb3IJTZhxMU8ksCK+3eJ8xUW
         9Z77J/2R16g96J/by8Tdruh++NGf14xwt9vxlIPHh+IEJG/F22TYLKUM74bmpzQHTv2O
         kLW4P2JvSRvr9Qmbg6Z+HWFaU/+7xYLQL3Qxk/rPTknw4sTMdS3lyYZ1w0HMSG602tpO
         8EK668A0h8D5+dSpM9jYtLfzrQ9D2uAu1H0YP7m6ie9CbWVYLSREI/rc2QpMOQn+vkt8
         oD8w==
X-Forwarded-Encrypted: i=1; AJvYcCWIM5AoCxqyGFriug5VbDYel50xcgTCUoLbHcYrZGZT+2X80FOpnGEbJMr98jfmXxFIixM4QGf5CwLI@lists.linux.dev
X-Gm-Message-State: AOJu0YyxkV7yWyUtPd6GTgACWiRopE2u9NBPSQit5ZFtlstpTWmShBua
	3N4Av47K6IXaik8Na4ewdRQ049h0uF6RKhy2C62uHxsMgJm6j3g434Vony8j79tzYySiooU3WCU
	IT2JTKLZOimT+E0AjdC4GOh+xFTEYUTIHS93A
X-Gm-Gg: ASbGncucqrsQRgBEeZrasdnRb+WTHaozDy3NarWmkhBjN5BNUqxwx6vXTKUvDY50sA3
	1R08MckMWKUEouXawv6INfagxtvbsMdmgZIJfmVzCprj8Kjd+scLm0BhqRLfUj+gWvov/5QYRk6
	xGjJ0l87Wpy5uFA1/AOUyAz/T7MGlUcXha0DUK
X-Google-Smtp-Source: AGHT+IEJdg9bvrmazKSaObyLFJyvWysTY9GZ1IrakNKlyqsc9PcsudY5cVnjW0AMjOxr//q3y/G2oTHH1ULQgsL6BR0=
X-Received: by 2002:a05:690c:6e0e:b0:6fd:359a:8fd2 with SMTP id
 00721157ae682-700baccc7famr70059317b3.26.1742591626216; Fri, 21 Mar 2025
 14:13:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250321102422.640271-1-nik.borisov@suse.com>
In-Reply-To: <20250321102422.640271-1-nik.borisov@suse.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 21 Mar 2025 17:13:35 -0400
X-Gm-Features: AQ5f1Jp901Ps5YHdQiwmT3LZ4ohZiC6256GsYwktLVbiz-fabRCF7SyN3qruNTw
Message-ID: <CAHC9VhSpgzde_xRiu9FApg59w6sR1FUWW-Pf7Ya6XG9eFHwTqQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Allow individual features to be locked down
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: linux-security-module@vger.kernel.org, serge@hallyn.com, kees@kernel.org, 
	linux-kernel@vger.kernel.org, kirill.shutemov@linux.intel.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 6:24=E2=80=AFAM Nikolay Borisov <nik.borisov@suse.c=
om> wrote:
>
> This simple change allows usecases where someone might want to  lock only=
 specific
> feature at a finer granularity than integrity/confidentiality levels allo=
ws.
> The first likely user of this is the CoCo subsystem where certain feature=
s will be
> disabled.
>
> Nikolay Borisov (2):
>   lockdown: Switch implementation to using bitmap
>   lockdown/kunit: Introduce kunit tests

Hi Nikolay,

Thanks for the patches!  With the merge window opening in a few days,
it is too late to consider this for the upcoming merge window so
realistically this patchset is two weeks out and I'm hopeful we'll
have a dedicated Lockdown maintainer by then so I'm going to defer the
ultimate decision on acceptance to them.

--=20
paul-moore.com
