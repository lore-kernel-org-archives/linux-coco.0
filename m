Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C29158D7C
	for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 18:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706639007; cv=none; b=QNzlFI0eIs+9BKTtFR5YZtYllRLtYapEzAE9V6/nAmlEitVDkD+j119kA8h/wFbmkyekDNoSL7IooCwmymlOLB0QVRXpDK689LNGsJf3RtZE7Xl8zOufqGP3VjPeOtuOwpc76Iz0sYS+5EUxW44ZOI3Ss+EtlZMiPM14iRbhmKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706639007; c=relaxed/simple;
	bh=tFEQWdC7qrSSJgBCf20kPWPQDzbsJc6pm+yZ/F2PHFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ND4y63s5lPI9PAoFCYqmkZaok0QEqrbOOqqg6Cd84QaxltIu3sbowcCbHBSnaNKe3g5rBVhLEw4I0N4DHp33zVPT04GUPQtqyB2/DFgKl/uAsz3Voywr3vIa/oWdQWJlHqhzKNYlD3lDHOHbyICQgi4G19GZNAHmBtNHKiIR4EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=XYdxOR83; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="XYdxOR83"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E400C433F1
	for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 18:23:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="XYdxOR83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1706639001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a1sYTIAW5AD0V6cAd7FYqCUf83efZ/AKDlxt6jV+ahg=;
	b=XYdxOR83o3fjVUXRBl2LHiTynqtTjbuyX8Eem5XyqKjN+YSj3Byfn976C0o7ZoHqEblhO6
	I3LBkfUibJxhG5ki09Ye4Z5Gd8YFqEoZEPd/ywIn74nEhlGIGg4GgK+VGLxRz2j1FtBaat
	j0wIzUyd1RAAQRd+PViJfiobx3nIgfU=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 86573ed3 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-coco@lists.linux.dev>;
	Tue, 30 Jan 2024 18:23:21 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5ff7ec8772dso44045797b3.0
        for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 10:23:20 -0800 (PST)
X-Gm-Message-State: AOJu0YwunALhC+Up0eZSrGhyRpassXPakzyM8k7Srnp+jXbSflPv4uik
	beZdMXQ7WDMm1hoyu+G0+QSmHRBgss19YVQNSw8MqgRnvQMQa6+9/VVBRkCqnAeFD9WidQG11sY
	4pEt+KvLZgfWxPjpyIaGT7USbd9k=
X-Google-Smtp-Source: AGHT+IGi+WlDvpLs2+MvJdIHiXkSf7f0bSNRyfDDxLgLxGnU1DguC3rTf0plwcLWwoQNFno4Xm7PUCK5ZV4FyiWGbrE=
X-Received: by 2002:a81:8a85:0:b0:600:11f6:2c28 with SMTP id
 a127-20020a818a85000000b0060011f62c28mr6977021ywg.37.1706638999894; Tue, 30
 Jan 2024 10:23:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240130083007.1876787-1-kirill.shutemov@linux.intel.com>
 <20240130083007.1876787-2-kirill.shutemov@linux.intel.com>
 <CAHmME9qsfOdOEHHw_MOBmt6YAtncbbqP9LPK2dRjuOp1CrHzRA@mail.gmail.com>
 <DM8PR11MB57507611D651E6D7CBC2A2F3E77D2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <88a72370-e300-4bbc-8077-acd1cc831fe7@intel.com> <CAHmME9oSQbd3V8+qR0e9oPb7ppO=E7GrCW-a2RN8QNdY_ARbSQ@mail.gmail.com>
 <a076974c-e2c7-43c9-9858-71c913361cea@intel.com>
In-Reply-To: <a076974c-e2c7-43c9-9858-71c913361cea@intel.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 30 Jan 2024 19:23:07 +0100
X-Gmail-Original-Message-ID: <CAHmME9qEaJvaV2OVhpqPNnu4YmD-GgbqeePZPjZwA-XiHkeTmg@mail.gmail.com>
Message-ID: <CAHmME9qEaJvaV2OVhpqPNnu4YmD-GgbqeePZPjZwA-XiHkeTmg@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/random: Issue a warning if RDRAND or RDSEED fails
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Reshetova, Elena" <elena.reshetova@intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"x86@kernel.org" <x86@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"Nakajima, Jun" <jun.nakajima@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	"Kalra, Ashish" <ashish.kalra@amd.com>, Sean Christopherson <seanjc@google.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 6:58=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 1/30/24 09:49, Jason A. Donenfeld wrote:
> >> Anybody disagree?
> > Yes, I disagree. I made a trivial test that shows RDSEED breaks easily
> > in a busy loop. So at the very least, your statement holds true only
> > for RDRAND.
>
> Well, darn. :)
>
> Any chance you could share some more information about the environment
> where you're seeing this?  It'd be good to reconcile what you're seeing
> with how the hardware is expected to behave.

That is already in this thread already. Maybe catch up on the whole
thing and then jump back in?
https://lore.kernel.org/all/Zbjw5hRHr_E6k18r@zx2c4.com/
