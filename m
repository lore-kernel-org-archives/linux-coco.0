Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092E91D545
	for <linux-coco@lists.linux.dev>; Fri, 26 Jan 2024 16:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706288144; cv=none; b=diQ8jeL6cuCVjJzQkt66W6hD7op/iMerhTsHuH2h2cPJpNZqi8y4QHGCApYb3ALrH1/HyZjjqgfTYqhts/Zubu1ocjN7UbVvICi7IpoYFmslqJmq/LlblRVpdmQgaspSiF7FJDOUXvT4jptFOaSgn4xWBG8uh93Uq+UezmNqTWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706288144; c=relaxed/simple;
	bh=zxwhVOLE3gzPx1lLnJ7kUSvc4kjwJMjq+fDCZLpDEU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hkDRoDh4A4jC5aeNc9XJ+XddtUaDFCsYozPj5YJzXjRHo+oVGSE+AvfKfmAxN8q3rBRUe4bsoSNVFPGfm6BnuEHE1zU0ArYuk9FLQEKhWF3mXeUsFr84XCLDzdWOgf9+J5TYcbMqz8obBYvA/1HG7CTDL0LJnZywx7nJ1NWvLSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mhUWhp14; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mhUWhp14"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55d418c5ca1so5719a12.1
        for <linux-coco@lists.linux.dev>; Fri, 26 Jan 2024 08:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706288141; x=1706892941; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxwhVOLE3gzPx1lLnJ7kUSvc4kjwJMjq+fDCZLpDEU8=;
        b=mhUWhp14LaFYd1m5h6nkPCzXqmdlrlju8coX/2kSwdX9BcvpSzLW/+tSSMlpGJmKMM
         wQbDjk3QlwfX6S4tLP9xDh0mVWqBIDiHPjG9mHJK/PeH5Kuw0LmQupmLCN5qVycM2gnX
         dKBPnjNHj1MhCbBBKPMxQxwYAuj6me2DQR4Q4BPP8jWYTsSKXy0YOBk+un9zQMVIOrTw
         kTPMf2TNw8U5KDCl09C8qUQXBH9VxBgcjmpE3nUoirOXCPFB7F03lSXc0ypDDAGuwDCb
         UfaQKeFPaXRsw2XBah8IcxqdiT4UVCWWV4CKvsRB2rZYcWBsp94zmxxs0NmRYuUmUMEf
         MNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706288141; x=1706892941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxwhVOLE3gzPx1lLnJ7kUSvc4kjwJMjq+fDCZLpDEU8=;
        b=cRES4LTUTpkhUnHBXGumgmzwZSNqcShVuZtJ79qw5fq8bRESVF8rXwZO5Ci1AXCTDY
         7YY5P5A7mdxj4wR46itpO+fGIrIcu8Kxg3uoZAovZzSQmva7jzozS9sY+amZpDghFs50
         oQhzwxaMMdz3Yl8sEwt7r8kIY6wA1R12pyPxgzGe1higg2epZNMumjA3icY/mV/mIapZ
         EQgIwf8hdA229TUzoyG2d7F1LNUo2ju0/m2uU/iCpRMbPg/kzvJlPhZhUV/iSGvueJj+
         E4QJxd6o4FDClUnozVnJwR0r+Tcadq784Or3IpfONxSSUScd5FjIUAFjbkeGkYeR5QzJ
         B+xQ==
X-Gm-Message-State: AOJu0YwXOdoqs5fL0aFycMW5M/fKOfxPvThakAFYi+81B+7Eka2EczeG
	an8gCKZPnJl08/ljPzJD9JtcKDCWZLywymwIk8RIFnp8HlUZTYObl/My0kVDhV+oA7jA5wptamO
	Vd9Mb+9wV8O4OzYWxinYdT58lrFzA1fe2E3Ku
X-Google-Smtp-Source: AGHT+IEBXRn/yWC2G3iLvBVpTnf7frUux03kuFyEOJZMUmvVIkI7QkDfzNcoibbTn583SotrwZpKTXcErZZGb809pYo=
X-Received: by 2002:a05:6402:22cb:b0:55d:20f2:6d64 with SMTP id
 dm11-20020a05640222cb00b0055d20f26d64mr192253edb.6.1706288141014; Fri, 26 Jan
 2024 08:55:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240114223532.290550-1-sameo@rivosinc.com> <20240114223532.290550-4-sameo@rivosinc.com>
 <1bbf8d3e-aa94-48c7-a1e4-76f9eefc4af7@linux.intel.com> <65a72c305291f_3b8e29484@dwillia2-xfh.jf.intel.com.notmuch>
 <5539c533-37b2-4b12-a5c5-056881cf8e3c@linux.intel.com> <Za1G9I+tYuIL9ser@vermeer>
 <CF3D8DE1-AD47-4A77-B8BD-8A12A6F7E9DB@google.com> <MW4PR11MB5872F46A2089C8C2D8EF7A008C752@MW4PR11MB5872.namprd11.prod.outlook.com>
 <65aecbbce09dd_107423294b7@dwillia2-xfh.jf.intel.com.notmuch>
 <c3b99264-233b-4997-9e20-c4c2693b8cdc@intel.com> <65aeecea827f0_37ad2948@dwillia2-xfh.jf.intel.com.notmuch>
 <14dffda2-f413-4304-9932-3ac8ddfb30e4@intel.com> <85109de4-5832-4e14-8416-6443ac417c9d@linux.intel.com>
In-Reply-To: <85109de4-5832-4e14-8416-6443ac417c9d@linux.intel.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 26 Jan 2024 08:55:26 -0800
Message-ID: <CAAH4kHbhiyruEHiVx6cj_CangiD5L40+aRJBjgFJ65r9VHxpbA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/4] tsm: Allow for mapping RTMRs to TCG TPM PCRs
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: "Xing, Cedric" <cedric.xing@intel.com>, Dan Williams <dan.j.williams@intel.com>, 
	"Yao, Jiewen" <jiewen.yao@intel.com>, Qinkun Bao <qinkun@google.com>, 
	Samuel Ortiz <sameo@rivosinc.com>, "Lu, Ken" <ken.lu@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 12:59=E2=80=AFPM Kuppuswamy Sathyanarayanan
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>
>
> On 1/23/24 10:48 AM, Xing, Cedric wrote:
> > On 1/22/2024 2:32 PM, Dan Williams wrote:
> >> Xing, Cedric wrote:
> >> [..]
> >>>> So, yes, the mapping should be allowed to specified by the low-level
> >>>> driver, but at the same time every vendor should not reinvent their =
own
> >>>> enumeration method when we have EFI for that.
> >>>
> >>> Given PCR->RTMR mapping is static, I just wonder why it needs to be k=
ept
> >>> in kernel. Given that PCRs can never be 1:1 mapped to RTMRs, and that
> >>> TDX quotes are never TPM quotes, applications used to extend PCRs wou=
ld
> >>> have to be changed/recompiled. Then wouldn't it suffice to define the
> >>> mappings as macros in an architecture specific header file?
> >>
> >> I think something is wrong if applications are exposed to the PCR->RTM=
R
> >> mapping thrash. I would hope / expect that detail is hidden behind a T=
PM
> >> proxy layer sitting in front of this mapping on behalf of TPM-client
> >> applications.
> >
> > Hi Dan,
> >
> > My apology for the confusion! I think we are talking about 2 different =
scenarios - (1) this patch alone; and (2) this patch + vTPM.
> >
> > Scenario 1: This patch provides RTMR access only. My assumption is, the=
re are existing application (and/or kernel modules) that extend to PCRs tod=
ay and would like to work in TDs where only RTMRs are available. Changes ar=
e of course necessary in those applications as TPMs/PCRs are no longer avai=
lable, but from security perspective they would like to keep the same activ=
ity log and just change to use RTMRs (in lieu of PCRs) as the secure storag=
e. Hence a PCR->RTMR mapping is necessary and must be agreed upon by all th=
ose applications and relying parties. IIUC, this is the intention of having=
 PCR->RTMR mapping config maintained by the kernel, as proposed by Sam O. o=
riginally.
> >
> > Scenario 2: A vTPM is implemented on top of this patch, in which case t=
he existing applications don't have to change as they can continue extendin=
g to the same PCRs, which will then be emulated by the underlying vTPM impl=
ementation. PCR->RTMR mapping in this scenario is obviously internal to the=
 vTPM and I agree with you completely that it should be hidden inside the v=
TPM.
> >
> > My comment in my previous email was regarding Scenario 1. I hope the cl=
arification above helps.
>
>
> IMO, we should adapt an approach with as minimal user changes as possible=
. So I think we should try to avoid scenario 1 if possible.
>

I would note that the MapPcrToMrIndex mapping is an entrypoint of the
EFI_CC_MEASUREMENT_PROTOCOL boot service of UEFI v2.10. Similarly, the
event log should be collected before called ExitBootServices and made
available at /sys/kernel/security/coco/binary_bios_measurements.

>
> >
> > -Cedric
> >
> --
> Sathyanarayanan Kuppuswamy
> Linux Kernel Developer
>
>


--=20
-Dionna Glaze, PhD (she/her)
