Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B6A233711
	for <linux-coco@lists.linux.dev>; Wed, 15 Oct 2025 14:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760537957; cv=none; b=gDAIB+Jaa1ejhpQ8OqQxN98+jKMNzeM59Wu0zY2hZaiM/6ftAVZV8cd35rTi+masUz7MMmbpZOSJz8UnbxzgD+hUOgJ1aCnCeoS0o8d4djr2aIW6Hpe+H5VIUxcEOWMkdycGroNiSXngmgG5IWtR0a0EEmzhXHTwOMRslq2I6C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760537957; c=relaxed/simple;
	bh=ahnyCh5R5YFZLiOo76ToNT+ZdHj0T9SGh5TEC5IfhYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uQm7yVpOmrml79BAYDUzmuqqa/RQttRqdFLXiuQ6JZcLBGqF0JXE8siioVbKEb6Q/TzlN4qaAHI1c9B2lp8Aj7jAhBOQ8P/GsxGidmNHpGu+oXcyDMTRXQgwL7GVk9L7gzRoUyulMWLjOFgfCxDxhfdIyQFT/yqfk4B9KwukaRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3Pt854fo; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3Pt854fo"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-27eeafd4882so245565ad.0
        for <linux-coco@lists.linux.dev>; Wed, 15 Oct 2025 07:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760537955; x=1761142755; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCNBMdJdwB64svQgLfQeqcexCDnkXaxgEUAP3+vIY24=;
        b=3Pt854foJGd1dedoIgAeegVIuwV/cQ94KtIWX1Zvmp0PpPz7GaQVsppJF63MLenlC4
         XVTwF9ky6l1nmrb8TbmdTkErPrE9xeXAiH1zMWkDPagQt13JNJ/NurciuzvInzLuMquo
         z/HEGC7xPjju8BK8Qe7x5g9x62ZqX7G8ngG6Udrimn57dB8vbkpMG+bFU0ZVdc7cQVk1
         vyRbKbSQGFFYsRIxtGkg2ZbVChIs/iPchoPHJpwa6f+a9zrPC11CEqNtX/PlJ/wdydaC
         fBs4/dd/wmMI1RPLzLRcTv/eBFlu2H+4JTpvTu/vxAavWQVafsJEaUyd/4BfFiSDF49P
         AMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760537955; x=1761142755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCNBMdJdwB64svQgLfQeqcexCDnkXaxgEUAP3+vIY24=;
        b=RPirV9R2A7jYMjHZmdnymE0QWmUPHRMyGJWTlyiOWkPI9KjjbTiAm7LJAFwaZY+E7S
         In4qvBFbv9Xa0sjs1cug1oz1sMGrpGGV2qn3jpGlz7y79o7z3OO82bPWfraU4fXQCVwe
         BWAK5BIsjvtOss1eUNqQYq29J0lp7eYd4TD+/wfjf9u3mPtI60rb6TF4OGoE3VgB57XQ
         LJyD4pEWnOH60I2/NW1g0k+ZFzcQNRs6oMcM6u7J7r0MGSUiSRpkXSiGWF4rt7I2Pkb4
         Sv6H6mWx3bxKONEMuyUB0z/yJe1mAERz7p9tzjaE74+6H20otzHsIZ4ThvKgtUn+N0nL
         5msQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9ocYuuZc+SVUzzh1VdMfx+i2AC/5Yy98/8tCU+MPReEUzJRFAfZtvC4ltla/S9JqTQqAWnm2wupKC@lists.linux.dev
X-Gm-Message-State: AOJu0YwKtF/L7+6Z2DV3a6x08g3WKmQ8HXIpRXLV7sNFYeAI1VYSz8Lz
	F0X/9p5Uf8zSaxU+Sd+tC9jS2P7hZpniBXjrRPucRJIbex/pDuJxgKV/zdw6dbVvpXxa49E0GpA
	hw+jGYljCtfM4aZk7SYuEXcIsl6UAPNufscrfke0J
X-Gm-Gg: ASbGncs4v8qj2tsEUSDfD9BjYL4nI4jKSJbtWiP23N/qdqGy1A7XLXtH9d/w0mN8fCd
	EGM6YwBTc2UFye3JJVpKD7UcTRvfrnCEFyuP+tczYBjRxcPL8WolieZLewKLmnHjnfbgJUluXhG
	7w2kgBC0h90KFIRvLy2L3D4dCN2DIg1gK6xMXzio+aNzpkgYjNW/EJVb2tyMQtFtvDvVRHBI425
	s/cmTq5OCVnGEHx44v9Z0fLooT4nXJLS1hsTsGws+GuqIe+49fr0fqLQ0tO8dM0Pw==
X-Google-Smtp-Source: AGHT+IHbrKGyHgyLNoSCIdBbTZkdLJfabMC03fgDQKhmrZ1EoKqCqqsSYDZsJamV5nH7yv64jCZddGCI/SoNF2uOK1A=
X-Received: by 2002:a17:902:cccd:b0:274:506d:7fea with SMTP id
 d9443c01a7336-29088b377f4mr3550475ad.5.1760537954542; Wed, 15 Oct 2025
 07:19:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251001025442.427697-1-chao.gao@intel.com> <CAGtprH_FzXjnC0Rbctpvm2_kqAAnUOfnaT4885fBiAi7s0jcXw@mail.gmail.com>
 <IA1PR11MB949522AA3819E217C5467B51E7E8A@IA1PR11MB9495.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB949522AA3819E217C5467B51E7E8A@IA1PR11MB9495.namprd11.prod.outlook.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Wed, 15 Oct 2025 07:19:01 -0700
X-Gm-Features: AS18NWBxbEW9bsNjqLRNqJQ0HIKpJDLUxowkEdxssJCTakHfAQlYHCoSzv6AcpM
Message-ID: <CAGtprH93h_f11-mBRExr7xwN284Otnk6vi9R-b5PfVtL+wvXaQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Runtime TDX Module update support
To: "Reshetova, Elena" <elena.reshetova@intel.com>
Cc: "Gao, Chao" <chao.gao@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	"Chatre, Reinette" <reinette.chatre@intel.com>, "Weiny, Ira" <ira.weiny@intel.com>, 
	"Huang, Kai" <kai.huang@intel.com>, "Williams, Dan J" <dan.j.williams@intel.com>, 
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, "sagis@google.com" <sagis@google.com>, 
	"paulmck@kernel.org" <paulmck@kernel.org>, "nik.borisov@suse.com" <nik.borisov@suse.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 1:54=E2=80=AFAM Reshetova, Elena
<elena.reshetova@intel.com> wrote:
>
>
> > On Tue, Sep 30, 2025 at 7:54=E2=80=AFPM Chao Gao <chao.gao@intel.com> w=
rote:
> > >
> > > =3D=3D=3D TDX Module Distribution Model =3D=3D=3D
> > >
> > > At a high level, Intel publishes all TDX Modules on the github [2], a=
long
> > > with a mapping_file.json which documents the compatibility informatio=
n
> > > about each TDX Module and a userspace tool to install the TDX Module.=
 OS
> >
> > [2] mentions about a limitation of doing runtime TDX module update:
> >
> > "Performing TD Preserving during a TD Build operation might result in
> > a corrupted TD hash in the TD attestation report. Until fixed in a
> > future Intel TDX module update, a host VMM can avoid the problem by
> > not conducting a TD Preserving Update while TD Build operation is in
> > progress."
> >
> > Do you know if this issue is fixed already? If so, what version of TDX
> > module fixes this issue?
>
> It is not fixed, because the limitation comes from the internal crypto co=
ntext
> maintained by the IPP crypto library. Different versions of TDX module ca=
n
> use different versions of IPP library (as any good SW that aims to take l=
atest and
> greatest version of its dependencies) and IPP library (as any library) do=
es not
> provide any compatibility guarantees on its runtime data structures.
> So, the problem can show up if the old and new TDX module (prior and post
> TD preserving update) use different IPP versions and IPP happened to chan=
ge
> internal data structure format in between these versions. There is nothin=
g
> TDX module can really do in this case.
> But the situation can be avoided fully, if TD preserving update is not co=
nducted
> during the TD build time.

Few questions:
1) How is TD build time defined in this scenario?
2) IIUC, this series doesn't add any protection of TDX module update
against ongoing TD build steps, is that supposed to be the
responsibility of userspace VMM?
    - If so, what prevents the series from building in this protection
in the kernel?

>
> Best Regards,
> Elena.
>
>
