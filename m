Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC44412FF7C
	for <linux-coco@lists.linux.dev>; Wed, 31 Jan 2024 18:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706725030; cv=none; b=Bzl1qsJ/XnLdwmw4suyOHcDHwJT4CIe4dbh7k2zD1KMIo6/B5gi2HIkXgvTOoucH+aJIE8yKjiqztd9Aafy2M+v54tuQI2p4CbpW+YRXS6vrrX6TWogIrFcbT0QYMJwWorXqgczPMQSi6YEa0u1E8JwzsTzcVnO7pPfjKrYCpK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706725030; c=relaxed/simple;
	bh=lSL7ZiS6AF8e2f46sDRNj1OPxHM2bdMKamA8rT7qT4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QhEd3lrBAZx7ofyqh/kjLWm3E08JaqewoOhF+T8/zfmn+y0pPtp0KXOxlJPkRGcIhswfFdzt4j67+g2OY3UVtonh0q00XD8QSIZPQOcDGaaWZScmnC3jdr5/Zi9tEErWW/W+yUOxyuEDbd3YGt1KC83RioHj3domTkKbZBTTORU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uRhM7bFH; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uRhM7bFH"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-36394219fbfso5165ab.1
        for <linux-coco@lists.linux.dev>; Wed, 31 Jan 2024 10:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706725028; x=1707329828; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGoGC6xB6KW9odfFn1t46MQGiYGwOCppmvmcxLORiTA=;
        b=uRhM7bFHOs1/C/MZsSlMEZVqD+y/2QqDiZ+vTn7dmi8hTyQf9/LtsoalUy1aVFzqRa
         X1dhAsw3wflDbjS6+buBAwkyxGUIPpnqiGRduTCWnI+w37PSD37RMfINp7sJ1+ZdEhxw
         g1cZI8TOfkKsD/R+wouvUXApLoPuikCYxb3d6ClXJewrDUc5vQi7iiyYXxb2gCRA+49W
         PEH7/QKmqGyBl6SKAMBAVjPK/QrKfU0z4uIqYfBPY5VHFvTk/Eq4LcYCNCY/gTbe0mT+
         RlwW0oWl6kQ9YdPUAdSRB/uQqB0vmhiqKEsTzZ0eMQeBD2HTTyNrVka106FHhuG8UfTq
         6NDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706725028; x=1707329828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cGoGC6xB6KW9odfFn1t46MQGiYGwOCppmvmcxLORiTA=;
        b=B8Kv9APgWJmd5ZrBX9GQvmX7vDr/6Evt4c2qJWwmODTwMCKAkrCvwRCyapFUCo37zn
         ciOVHVRPKLF/71dptjP/YeKXlq6JtZtmzyCiucH0xluTzduLvhLxpdEgButLQ+dk6iuT
         prqV19vSHWwUN9qtSsmbeQ2cMN6EJ86i2aXoDjzrb6vc4xbzmKYqKZZ1lkR2X2dRrFnJ
         RF4zXvnBJmPLK91QWaVzxqZ0JySx9/mOx3SkEXg2NOX5UhV7F8QjEVRgnhNl45+Uyx/c
         L31UWtWVbi//kxrBUVp3v204btv+7+WK/SG9iyAJWJWk2dWuu7HsRoiIJbUn4TPXDhW6
         vwBQ==
X-Gm-Message-State: AOJu0YyEEtkYifCFcwqeOTaRQTXBCRigGqb/6FRZvPwsr2nvJQx7kEQ0
	8SRkM8sXo/qnlAELWWnZn6Ev1cJFTUAjZ+he2jLLYWukBU9TX2y/oHxXvsfq/aCPDweZ7ydpGYZ
	4pRKHykE/Xy/G2HcEGu4O6DKAivc32z+p9sfq
X-Google-Smtp-Source: AGHT+IHycvDls/YT+3j8QE0ZFLpsakcLLNDEcd+SkH5MogAi7j4e2wPM1sO7EFqC9NaJxi/HxumIw1JCoMp8P/VnjQo=
X-Received: by 2002:a92:c9cd:0:b0:363:8388:dbd1 with SMTP id
 k13-20020a92c9cd000000b003638388dbd1mr15806ilq.16.1706725027987; Wed, 31 Jan
 2024 10:17:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240121182040.GBZa1geI5NxWSslvt0@fat_crate.local>
 <20240130220845.1978329-1-kevinloughlin@google.com> <20240131140037.GDZbpShX2b0elXlqDA@fat_crate.local>
In-Reply-To: <20240131140037.GDZbpShX2b0elXlqDA@fat_crate.local>
From: Jacob Xu <jacobhxu@google.com>
Date: Wed, 31 Jan 2024 10:16:55 -0800
Message-ID: <CAJ5mJ6j-Vw2P=QLK-J_J79S35UggvZPtm5sia74=enR1qq9X9A@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] x86: enforce and cleanup RIP-relative accesses in
 early boot code
To: Borislav Petkov <bp@alien8.de>
Cc: Kevin Loughlin <kevinloughlin@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Pankaj Gupta <pankaj.gupta@amd.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Dionna Glaze <dionnaglaze@google.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Michael Roth <michael.roth@amd.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-coco@lists.linux.dev, 
	Ashish Kalra <ashish.kalra@amd.com>, Andi Kleen <ak@linux.intel.com>, 
	Adam Dunlap <acdunlap@google.com>, Peter Gonda <pgonda@google.com>, 
	Sidharth Telang <sidtelang@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 6:01=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Tue, Jan 30, 2024 at 10:08:43PM +0000, Kevin Loughlin wrote:
> > Instead, this patchset continues the approach of fixing the immediate
> > problem of SEV-SNP boots crashing when built by clang, providing a
> > backport-friendly set of changes needed to successfully boot SEV-SNP
> > hosts and guests.
>
> What use cases are those exactly? How do I reproduce them here?
>

We're interested in fixing SEV-SNP guest boots which are currently
broken when using a guest kernel compiled with clang. It seems like
every other user of SEV/SNP linux kernel code uses GCC to compile the
kernel so they've avoided this issue.

> SNP is not upstream yet and the SEV* code has been out there for a while
> now without a single such report so this must be something new happening
> due to <raisins>...?

E.g. Google COS uses clang to compile the kernel and we've made do
with an internal fix for a while. We've unfortunately just been rather
slow to report upstream.


>
> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
