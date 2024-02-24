Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC096117
	for <linux-coco@lists.linux.dev>; Sat, 24 Feb 2024 01:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708737315; cv=none; b=JprLbKKiDuYUbrSuM72Ld3Dnl9AOqK40r8ZhsFpuJhjyF75uY5gFIO7lkp7H+CFEuX+h9weYHG8qjXbCwQ83Ri+4355kMs62aPWnpuUsSRaq8NMKVDUKqGbR/anHVsLnqALYzfkHNiu9+pvCtdgsdZ8WokJTsBeS6WBKF80L0wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708737315; c=relaxed/simple;
	bh=+9h2xKjOMwpJ6vwxTee5GD98+h73IuypecWdP3G2C1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9CDyxZEFYpzTfp+6kilbHhy17SWp2uIouIbBgcd0x/tIN+jLf97deVL1GbQdDbQ+pfJmkVdIEv2qbQnzuWixsk+7J403f+PEiwrkN74n6+tfocikoOKnSFB78ATC67ObwIiTdzqbLVhzkcTwLJCDBl0ErJqFzrrYu0K6VfoeZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=Fa7v4/p6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Fa7v4/p6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1128C43390
	for <linux-coco@lists.linux.dev>; Sat, 24 Feb 2024 01:15:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Fa7v4/p6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1708737309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CGk4NO32L+GTr1TJMRmS6aztEVWTdCZhKoXaii4F4RU=;
	b=Fa7v4/p6ZJnlmIBrjspF6YEnkJS86q99xfx9P0GdZTEYq9lFUlgag0NADIkcG/18l+8giJ
	UKaSlvuQwPac23L3apdKpIEOpVYaqmC/9OVA+xa9tGhoVheQTcTWNUaXd8B9mhWaNPXNh1
	ImkuubbvwIFNkTLRnx94SSspFhK0Q5M=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cfff3828 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-coco@lists.linux.dev>;
	Sat, 24 Feb 2024 01:15:09 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-608c40666e0so10728507b3.2
        for <linux-coco@lists.linux.dev>; Fri, 23 Feb 2024 17:15:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWu41xliAv77qEGmjP+zkKST5KWJptmzYZOnK1+6l8jETNuLbbpuipnRJOxRgDgtSWpoAAChyIMqY1NJuUS+GWfu+XeRLMLRchroQ==
X-Gm-Message-State: AOJu0YxDfaiD/v65+VMJk3hsgunlIXBboqHiKygiCp8LxR+fplKpSSA/
	prYssgfF//qXh4R6JJUGnTvoEE5n3+1fwUxEufH6wH7Auq7LrS8Nan1dDw1QVWaIbFLt0ogWgAr
	jVOKdiuIhW+YqqAL8D2ovNubUaX4=
X-Google-Smtp-Source: AGHT+IEgMvsUKNoqUqJ8XZiWuzsWmr4gdvUGtKEu7ZPJUyYRkG+YxkdPu+bBfZBw/GzEuvyVQeQr+XYSMf9dj0FgxVM=
X-Received: by 2002:a81:f20e:0:b0:607:7c26:7e14 with SMTP id
 i14-20020a81f20e000000b006077c267e14mr1356621ywm.34.1708737307407; Fri, 23
 Feb 2024 17:15:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5648f43d-76e4-4396-b626-411d60657c93@intel.com>
 <20240222020616.2315199-1-Jason@zx2c4.com> <9cec487f-ce7d-809d-b4a7-9b7a8a6c9c93@amd.com>
In-Reply-To: <9cec487f-ce7d-809d-b4a7-9b7a8a6c9c93@amd.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 24 Feb 2024 02:14:55 +0100
X-Gmail-Original-Message-ID: <CAHmME9oN+7rbLYcvQN=+KMjwrokvARy_7khLWJvDK=K_S5uHqg@mail.gmail.com>
Message-ID: <CAHmME9oN+7rbLYcvQN=+KMjwrokvARy_7khLWJvDK=K_S5uHqg@mail.gmail.com>
Subject: Re: [PATCH v4] x86/coco: Require seeding RNG with RDRAND on CoCo systems
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, stable@vger.kernel.org, 
	Elena Reshetova <elena.reshetova@intel.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, "Theodore Ts'o" <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tom,

On Fri, Feb 23, 2024 at 11:05=E2=80=AFPM Tom Lendacky <thomas.lendacky@amd.=
com> wrote:
>
> On 2/21/24 20:05, Jason A. Donenfeld wrote:
> > +
> > +     if (cc_vendor =3D=3D CC_VENDOR_NONE)
>
> I responded to an earlier version of this patch, adding that response her=
e:
>
> You probably want to use:
>
>      if (!cc_platform_has(CC_GUEST_MEM_ENCRYPT))
>          return;
>
> Otherwise, you can hit the bare-metal case where AMD SME is active and
> then cc_vendor will not be CC_VENDOR_NONE.

Nice catch, thanks. I'll do that for v+1.


Jason
