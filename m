Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D0E1DF240
	for <linux-coco@lists.linux.dev>; Fri,  7 Feb 2025 12:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738930192; cv=none; b=P8kM4tKdsYtx9/0iz/UdQwF0vg3vOIfgbEGxfsx/78OlMl+V2Q6TV/KUSIHQlgcJg9AzqyRWK7IJls/zMIGrTr8e3V/PTJ5GuDxceUPQ8+TXaRF7toC2zBhfHMn171wAS4PV9Nvv8kE42kzq6aZgg4DNLUw9FQ2h2ffldHfICeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738930192; c=relaxed/simple;
	bh=4pF195jRI8mjpC7aYEb7qPcoCnajxFj1HhZA4jePVNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sglkkh8GmPbwKG01nzDEDRb36iqG8RmpPh8Wb8I4qeYCdgFmekxcHH67TH0LN8LDO1Vkzuz5gZrf/sQHvjQ1I+gH90wbLLgBhJq8OA1woaf57y9mQrYuE/tztCf13945NO1rtIkOQaqRcXbH3kvzuILwadLQGFH7CVmwJ2miOyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iluNVOlS; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iluNVOlS"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab771575040so367564966b.1
        for <linux-coco@lists.linux.dev>; Fri, 07 Feb 2025 04:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738930189; x=1739534989; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pF195jRI8mjpC7aYEb7qPcoCnajxFj1HhZA4jePVNk=;
        b=iluNVOlS6W7jf1KTVJ0vthXrmBldJxG0fAUmQhUx8wBHYNi6Hmviyp5W8HAEYPBE/L
         i3x/FdJ5BYdVPJh/Ww+tATaAt58RbrnUYSp9MltgWQ5UPIkFWK+Sk7VbGtxvtSuSooat
         axDl6oOVR36Cn2xA8OjHZedPmmitq07KVIoQ3KlUDg1fY5H1tUUVV5/anYC9KU5racjH
         Grxd8BfPZbVy5nJ8mbqrS+cv+CFHe2Rw68wedcF3v8I09pGC4WNfbxP/gNROALZQ3fwN
         hvWasFQOUfEwAtO/R4dS7OwP+6munTKEWffLLWi6V3YwnvRg4UtOFIHrkXaTqjsUuJWf
         Xgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738930189; x=1739534989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pF195jRI8mjpC7aYEb7qPcoCnajxFj1HhZA4jePVNk=;
        b=sRSYnLOZudZe4Gg2Dj9uIwWoxoHJSuZEDZv+ou1xLk/mrV6rCOESrjC2ssVw9ArdY7
         k2tnRdhccSl4dVNqq4oMIWgpiXkwJQorX/0pDdhqm/tu6Z1dfFvvXL9RxyeQS7XYdBdk
         nXIaxABqxwAlJPAhXjqLHgMD8u730589WJGn7bl68s8PjLb3yzmS0mgH0s5v+4fL6dpa
         1oY3rFXrHvIsVbDBbn+LV28+Rj1A3pZJu7bvWBWaNH29NNVkodmVmfh1Lc+XqTb0UAb6
         iKbFyCqPfgcaLkO6JVYmOX/G7Bi8KPwIma2rGjIfUpaxMXIhDDfB17ugUBdYk5yTCt5O
         xsNA==
X-Forwarded-Encrypted: i=1; AJvYcCWfaJehr5OtFkxAQvM6pFZ/YY63owawpAi5g95Cvjx2t1FF7MEW45rch8aTg0NEG7X8VtV4yPD9aqhd@lists.linux.dev
X-Gm-Message-State: AOJu0YwhJIbYkNPRC0Eenxcjq8jZNFNqV6G1CkvRV0hs0oZQK5Ud/FzG
	IoFUCigJ9G3ddeBZUoQ4UAprtl3tcWoEaLd2DOefDhI7lhThChAkK12V7mkir1a46kNfNCK9z0c
	E6SqaMp0g4iUv0N+G1yAMTt5GeNk=
X-Gm-Gg: ASbGncvqnHeWYceWfVffZj265dpKa4qDx8gPu8NO0qwooEj6F+5/xP739YBVfBTLEAM
	3hnOVSQuIpwYZGN7K7Zn9Xlvsgzav/Wm4KN2A5qw4wVmHXXhs4rtN5v4eISKtvmRkHyL0cy1wIv
	k=
X-Google-Smtp-Source: AGHT+IHrbiWskXPle5ImdwLhrdLRBq1l1ymqvuJ3iK9ve3uv7DBb+2jINGkUj60DkJxJ5t3LfE4k4WUHDMyRSckgp7U=
X-Received: by 2002:a17:906:7309:b0:ab7:6d48:10a9 with SMTP id
 a640c23a62f3a-ab76e88d3a0mr822173366b.8.1738930188495; Fri, 07 Feb 2025
 04:09:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250207005832.work.324-kees@kernel.org> <20250207010022.749952-6-kees@kernel.org>
 <b4f08d43-c421-4e8d-9bbb-c954c4472f8a@intel.com> <202502061835.F57547B@keescook>
In-Reply-To: <202502061835.F57547B@keescook>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 7 Feb 2025 14:09:12 +0200
X-Gm-Features: AWEUYZnChrRXXIJNdmCjHjynXFGSUufAJmxvP7Q8yY-4-DWvfhOKjUuhnQ7LHUg
Message-ID: <CAHp75Vf4R73_GMNvsEWd3nyUKM8UEP22=9umArVsHYOA=dycWg@mail.gmail.com>
Subject: Re: [PATCH 06/10] x86/tdx: Mark message.str as nonstring
To: Kees Cook <kees@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>, Andy Shevchenko <andy@kernel.org>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-coco@lists.linux.dev, 
	Sathya Prakash <sathya.prakash@broadcom.com>, 
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>, 
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, 
	Kashyap Desai <kashyap.desai@broadcom.com>, Sumit Saxena <sumit.saxena@broadcom.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Nilesh Javali <njavali@marvell.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexey Dobriyan <adobriyan@gmail.com>, 
	Sven Eckelmann <sven@narfation.org>, Tadeusz Struk <tadeusz.struk@linaro.org>, 
	kernel test robot <lkp@intel.com>, Erick Archer <erick.archer@outlook.com>, 
	Dmitry Antipov <dmantipov@yandex.ru>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, linux-kernel@vger.kernel.org, 
	MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, 
	mpi3mr-linuxdrv.pdl@broadcom.com, GR-QLogic-Storage-Upstream@marvell.com, 
	linux-hardening@vger.kernel.org, linux-nilfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 4:37=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
> On Thu, Feb 06, 2025 at 05:12:11PM -0800, Dave Hansen wrote:
> > On 2/6/25 17:00, Kees Cook wrote:

...

> > So, the patch itself makes sense. But it does end up looking kinda
> > funky. We call it a "str"ing and then annotate it as not a string.
>
> Yeah, this is true all over the place. It's a string, just not a
> NUL-terminated string: *sob*

Maybe call it respectively, e.g., __nontermstr ?

--=20
With Best Regards,
Andy Shevchenko
