Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C576A337
	for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 12:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706618277; cv=none; b=BfjkE54TIeL9cKa2eeOegDg0MvuahK00jsZNXyc8vwWQZjNe8Ib5EUtX8++dGw0wwXf78BbZnmVMZWsH5e6h7WcmlYum56eWUjlaPhgMlzwIHHdPodgZUK/IfzrqdDxjdDGgPBVJ+FsoZyOz+oGzm/V0pTz2+HTUI8nK5OHlcsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706618277; c=relaxed/simple;
	bh=6IHRkEmE4K1gcHHdKvlNY7t2E1DSF1/hzSyoIXXO6/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IGP6fftsb3nhOERy+mZ0ZvABXjvgtVrM/h3fzqBkIjsxFpBmu5hlY+Zrhf1Zy9f+wWgOteA7+aFPJa9cM3Zdyt+B1e+RUoa7HtRyTK8Q81FMNvH/jD+Tajd7Pcc7GpWyAGW15Nrwo1qBXQTLwdeHpdAd+EIHEH6S353CKjbsSMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=hYzYuHIU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="hYzYuHIU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2466FC433B2
	for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 12:37:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="hYzYuHIU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1706618272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6IHRkEmE4K1gcHHdKvlNY7t2E1DSF1/hzSyoIXXO6/U=;
	b=hYzYuHIUipaBQUDTXnXawPwvPm7JYdqZN9UUMxYF7dafjApyRFLXN+TnsR3e8S3jarLqCZ
	JRXdrEv5O/02H7JGXarvzMZH/IVkXva4XwktDMP4QK+eowuQ/MmV1ASPPT/7n3SQhr3oUN
	l/Jlx9+iWkHwXWWqyqQ6jDHIPdyD++g=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0fbd833f (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-coco@lists.linux.dev>;
	Tue, 30 Jan 2024 12:37:52 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5ffdf06e009so38372187b3.3
        for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 04:37:52 -0800 (PST)
X-Gm-Message-State: AOJu0YwKj/bTXZO/QxQv1B4YDeCpz/5lzt8LxI+JdZolyZGdVbhDzda0
	s9MiKMpFU6nb/GgswBK/eo+i/yQBt8VeKE5HxnqNkEpmiEr42If5UcX1I5cN5uP6UQAKEh3baIL
	w83tKgZGtlHIKuMKweGIhfKWeM/c=
X-Google-Smtp-Source: AGHT+IGpW1R6n9OB/RMM2BkjSFsTFy6GK1jwie10aznulWsl553h+j3LheE0aS6i4WnG/IJvNzQca9ThJE4adCkvKUc=
X-Received: by 2002:a0d:f4c7:0:b0:600:adb:99fd with SMTP id
 d190-20020a0df4c7000000b006000adb99fdmr5798960ywf.43.1706618270864; Tue, 30
 Jan 2024 04:37:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240130083007.1876787-1-kirill.shutemov@linux.intel.com> <20240130083007.1876787-2-kirill.shutemov@linux.intel.com>
In-Reply-To: <20240130083007.1876787-2-kirill.shutemov@linux.intel.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 30 Jan 2024 13:37:38 +0100
X-Gmail-Original-Message-ID: <CAHmME9qsfOdOEHHw_MOBmt6YAtncbbqP9LPK2dRjuOp1CrHzRA@mail.gmail.com>
Message-ID: <CAHmME9qsfOdOEHHw_MOBmt6YAtncbbqP9LPK2dRjuOp1CrHzRA@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/random: Issue a warning if RDRAND or RDSEED fails
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	"Theodore Ts'o" <tytso@mit.edu>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Elena Reshetova <elena.reshetova@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, "Kalra, Ashish" <ashish.kalra@amd.com>, 
	Sean Christopherson <seanjc@google.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kirill,

Picking up from my last email on patch 1/2:

On Tue, Jan 30, 2024 at 9:30=E2=80=AFAM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
> RDRAND and RDSEED instructions rarely fail. Ten retries should be
> sufficient to account for occasional failures.
>
> If the instruction fails more than ten times, it is likely that the
> hardware is broken or someone is attempting to exceed the rate at which
> the random number generator hardware can provide random numbers.

You're the Intel employee so you can find out about this with much
more assurance than me, but I understand the sentence above to be _way
more_ true for RDRAND than for RDSEED. If your informed opinion is,
"RDRAND failing can only be due to totally broken hardware" then a
WARN_ON seems like an appropriate solution, consistent with what other
drivers do for totally broken hardware. I'm less convinced that this
is the case also for RDSEED, but you know better than me.

However, there's one potentially concerning aspect to consider: if the
statement is "RDRAND only fails when the hardware fails", that's fine,
but if the statement is "RDRAND only fails when the hardware fails or
a user hammers on RDRAND in a busy loop," then this seems like a
potential DoS vector from userspace, since RDRAND is not a privileged
instruction. Unless there's different pools and rate limiting and
hardware and such depending on which ring the instruction is called
from? But I've never read about that. What's your feeling on this
concern?

And if the DoS thing _is_ a concern, and the use case for this WARN_ON
in the first place is the trusted computing scenario, so we basically
only care about early boot, then one addendum would be to only warn if
we're in early boot, which would work because seeding via RDRAND is
attempted pretty early on in init.c.

Jason
