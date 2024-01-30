Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D9C6A017
	for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 12:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706617768; cv=none; b=YsmHvxLCUFH1Id/m5OPTosuUUnTybSkgHyaePPRa2Au3DRuDq4/TOubxygB4fjs1VpAotRDkVGhSPheLj4mawHW++Y5zKCpKpodBNsXqt+eFheeiStLFofUiF1KajZA7lotWWsguqz+BF9jb2TGSDq+8hJ+gNJhtaMYkML9UvlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706617768; c=relaxed/simple;
	bh=qsIiCLqaLUknvCs6gj9gNldzzaHio3dXD0f4X/3u4Jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+u17sJbCKFCpNZbXl200MdsEmri18nmKjq2MWaUx2c1TQp4UMq1N71auEM9SXhKNYbZ4BbR7K7TheLnuixEHFl6TmMDw4dnWPwYjFrGJYbnaPGeN+RZ2301TGs0t4DbJ+XWUzQIEOiEV+ulVAmBymncXiDMHuLVAZqWFgz47eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=XH2zLa12; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="XH2zLa12"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66CA9C43141
	for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 12:29:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="XH2zLa12"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1706617764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+mwVKBiEiIEYjQjxu2rl+y+jfQVIMNK8et3Pu7l5bfk=;
	b=XH2zLa12ra0STIo8dB3PSgZ4D1QNp8U5T/HAE6v0RAkdClr6ymJVdmlPoaHmIdvSjIM7/x
	FVjlR/fE6bHyQxBqq061wlrjlZ7EVycQMYtdsyJ8kw+pqkIIX1Wmd5OaR8LfywKHLnvuj4
	xcN0OHXfoykKjYvEBgmkdHiougK1hjw=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8bc7cc95 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-coco@lists.linux.dev>;
	Tue, 30 Jan 2024 12:29:23 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc261316b0dso3323947276.3
        for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 04:29:22 -0800 (PST)
X-Gm-Message-State: AOJu0Yz3G/0z6iFV7wwOxxMhUkJb1TUYA5xWBayXszBV0mshWtNF9oYu
	8r8hHT2oqxzFHxOB8FYAmFS1MgIqmNCcN2vCu/mJeB9kdtZ5NKChGfXeZ9d8/bBD6MideJwMO/p
	6MYsElD6VpEv7md65eulSjQRtUco=
X-Google-Smtp-Source: AGHT+IGzrUAZ8eeCxiURky9BbLZcKZRYDdZjm2ie1uZ/chlKKKDiusDHkduPVUrbda3ObuhZHE1pCVRlt8IC4qGfUUM=
X-Received: by 2002:a25:8e84:0:b0:dc6:4d0c:e9de with SMTP id
 q4-20020a258e84000000b00dc64d0ce9demr4850031ybl.0.1706617761118; Tue, 30 Jan
 2024 04:29:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240130083007.1876787-1-kirill.shutemov@linux.intel.com>
In-Reply-To: <20240130083007.1876787-1-kirill.shutemov@linux.intel.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 30 Jan 2024 13:29:10 +0100
X-Gmail-Original-Message-ID: <CAHmME9pOt=uEmuBzBpgUHw9DqAD2FZTZ3v53AOZbQ3Cd2p97xQ@mail.gmail.com>
Message-ID: <CAHmME9pOt=uEmuBzBpgUHw9DqAD2FZTZ3v53AOZbQ3Cd2p97xQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/random: Retry on RDSEED failure
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

I've been following the other discussion closely thinking about the
matter, but I suppose I'll jump in here directly on this patch, if
this is the approach the discussion is congealing around.

A comment below:

On Tue, Jan 30, 2024 at 9:30=E2=80=AFAM Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>  static inline bool __must_check rdseed_long(unsigned long *v)
>  {
> +       unsigned int retry =3D RDRAND_RETRY_LOOPS;
>         bool ok;
> -       asm volatile("rdseed %[out]"
> -                    CC_SET(c)
> -                    : CC_OUT(c) (ok), [out] "=3Dr" (*v));
> -       return ok;
> +
> +       do {
> +               asm volatile("rdseed %[out]"
> +                            CC_SET(c)
> +                            : CC_OUT(c) (ok), [out] "=3Dr" (*v));
> +
> +               if (ok)
> +                       return true;
> +       } while (--retry);
> +
> +       return false;
>  }

So, my understanding of RDRAND vs RDSEED -- deliberately leaving out
any cryptographic discussion here -- is roughly that RDRAND will
expand the seed material for longer, while RDSEED will mostly always
try to sample more bits from the environment. AES is fast, while
sampling is slow, so RDRAND gives better performance and is less
likely to fail, whereas RDSEED always has to wait on the hardware to
collect some bits, so is more likely to fail.

For that reason, most of the usage of RDRAND and RDSEED inside of
random.c is something to the tune of `if (!rdseed(out)) rdrand(out);`,
first trying RDSEED but falling back to RDRAND if it's busy. That
still seems to me like a reasonable approach, which this patch would
partly undermine (in concert with the next patch, which I'll comment
on in a follow up email there).

So maybe this patch #1 (of 2) can be dropped?

Jason
