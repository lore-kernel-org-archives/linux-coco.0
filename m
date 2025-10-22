Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D7B2D7BF
	for <linux-coco@lists.linux.dev>; Wed, 22 Oct 2025 15:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761147749; cv=none; b=sTZ15zGalaknY/lTFyPW7UJS+hHwXN9LtT0ZOAF+i0HhUfyCSsVZX2BQ2MhQIj2Y9jxAvpFURlFIaAV9GkwzB4m1vOuBYN2m3djVR/4I7skRaBM4Dk3+AAp5699fVNpQxvULNSWe0LKMrDAD0mpqRhUI4aswj2yYc/oSGRgbRC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761147749; c=relaxed/simple;
	bh=lrh9trOuUbfB9tr4S4CppAg4eYIoTFqaZqvi7679HzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LNIzues3idkQUePwJM07kln3hTQdJkuivJDaq8hwBeatN2XgtID/M/g/CTySDHQlS+Q/hjHkOtT0OTF6tBm7JSnYuySW6rvLvHzDFWuis6Im00nI7kFhUHvY5ZUe5/wGN965NsH36q7LarBfO8tiqT7GUeGMDaRwiw6El2KFzEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cQr8Yz/s; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cQr8Yz/s"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27eeafd4882so233675ad.0
        for <linux-coco@lists.linux.dev>; Wed, 22 Oct 2025 08:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761147747; x=1761752547; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzoL+yZOu+8De1TKJwlUHggqh8pBAGHO5eUlyyjXTpk=;
        b=cQr8Yz/sY6YKbAtBA6hzYDPCQMOTpcJNs7czc3OHNXTubERJxhtOzQY3gXq91e7TUT
         QiAIPut+JWB8Ik98fwv2rW1GkDDGUCv/o6euJ6axzJAuvjnL/4GxKQzfC3cFdj6xffEQ
         olIY5/zHhBMuAZn13j4avnc3s3yxgOWjgv8tBaI5spT5vrnT3Gusa4eqISG1j5M7ksWh
         lx3fgfdhjyZQRPPXw1TJtR1NOl1din3Ug7H1LnyDOHcwdUuxWxW9yDlmGgMCtjGa4Hpi
         5ich8ig42jBTQ1Dp8sQTUOoqw1zX0WnOq9BReJwgvNRbcLlM2p1WeOdeiMur13k4eA1Q
         H3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761147747; x=1761752547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzoL+yZOu+8De1TKJwlUHggqh8pBAGHO5eUlyyjXTpk=;
        b=n6OChSLaOQurgwvuxAIRiIvL22Pr18uS0lvmFZc14vQty+8Fg++hv32xgLk0MK/F2H
         jZm2na8xuGIk6q3FEAxMCRrELTwPdaxlSxoJ112TWt8Of33e0joE5qBbg283D2EAv5c4
         ATDerrVSSna/+cqEK38KlJOu2ByFumXCwt1DkICNN3r0Gsqd7v552/wSjnlx9zu2lM1e
         3HIsrLHsPxwDoFZ6yjcf2GEBDWik3j+iDfikeGR7raf4jWjgUEgePUWR1m4GC23STD3f
         L98/ZN8oVYmzbAB0m/p/+m4l9wbZwjNln2YqyX9pHQnW7+bsFVxXNpBrHt560EF8gKYH
         Ha2w==
X-Forwarded-Encrypted: i=1; AJvYcCUzo+/6dvDUgBkGh9FYZuGChKdiusbfUyzxqQS62eDO65RLiQICAf8G72h8L5qlKNFuMXnkqK070UBl@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5dwmi6xNHhMAYjFPw6O6cGTXQequa3LiWr6SZyHvB//pLiAmQ
	JFTtOA5oCJwS5qwx5MbG5zNG78/VDY1STbWZ67w0sKh0NYdOzSZu+KYiZNaQLZgzgtDzdRTEYAR
	uQi4n8wG12TRts8SzsMizSznl/q5Sef02/zIWEdCE
X-Gm-Gg: ASbGncs9GaFGd61pIabgLDa1BuBDXjaHJfeV8TKXBX17UK3DqGan7l0FFG9Ss4BvJeT
	OIzB2LGUkkBHHMqmm3atK7FjIUeyUsWUbhvIqE5WBW/YbXaDtyFLePiOfVIU5Wi9D3Ai9mqPrcU
	TAfpM+KxfZ/PuNzSH2jWwIVOk3RoWnFVXTABCR+k2PdPqXoC0eNBChsT3pMCRcZawXsN80LWa+U
	kxDGzLPbvXFV8J3KppsOBtt4TOdNmp4IhDZQcO+cRwLq+Locmgg1/5v2bPJ+VFQA1gJLYFTy3zy
	XE53EayyL0qPDF4q0AZBmrnTgad6
X-Google-Smtp-Source: AGHT+IHN5wM7xniJlXhXiDrVzdda1CBjT3wNmDvc4ugbOBZyMG4cRzMe9o5SvQOygWk52Qt8pxDlzqXiMUa6QjXw8Yg=
X-Received: by 2002:a17:902:f54a:b0:26a:8171:daf8 with SMTP id
 d9443c01a7336-29300ace4c2mr2290455ad.8.1761147746628; Wed, 22 Oct 2025
 08:42:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251001025442.427697-1-chao.gao@intel.com> <CAGtprH_FzXjnC0Rbctpvm2_kqAAnUOfnaT4885fBiAi7s0jcXw@mail.gmail.com>
 <IA1PR11MB949522AA3819E217C5467B51E7E8A@IA1PR11MB9495.namprd11.prod.outlook.com>
 <5b4c2bb3-cfde-4559-a59d-0ff9f2a250b4@intel.com> <IA1PR11MB94955392108F5A662D469134E7E9A@IA1PR11MB9495.namprd11.prod.outlook.com>
 <CAGtprH96B5K9Hk5h0FgxSUBa-pik=E=dLrO-4oxx76dxb9=7wQ@mail.gmail.com>
 <IA1PR11MB9495BB77A4FAFBD78600416AE7F6A@IA1PR11MB9495.namprd11.prod.outlook.com>
 <CAGtprH-h_axusSLTWsEZ6QoxgmVs0nVknqNJx-iskpsg_qHKFg@mail.gmail.com> <aPiEakpcADuQHqQ3@intel.com>
In-Reply-To: <aPiEakpcADuQHqQ3@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Wed, 22 Oct 2025 08:42:13 -0700
X-Gm-Features: AS18NWCKamJJqOgfaVBvWApA5RD4LCnBz687TAXQf72Y4CIsxZQOYxW8E_FTLCQ
Message-ID: <CAGtprH8q5U6h3p5iDYtwRiyVG_xF8hDwq6G34hLt-jhe+MRNaA@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Runtime TDX Module update support
To: Chao Gao <chao.gao@intel.com>
Cc: "Reshetova, Elena" <elena.reshetova@intel.com>, "Hansen, Dave" <dave.hansen@intel.com>, 
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

On Wed, Oct 22, 2025 at 12:15=E2=80=AFAM Chao Gao <chao.gao@intel.com> wrot=
e:
>
> On Fri, Oct 17, 2025 at 05:01:55PM -0700, Vishal Annapurve wrote:
> >On Fri, Oct 17, 2025 at 3:08=E2=80=AFAM Reshetova, Elena
> ><elena.reshetova@intel.com> wrote:
> >>
> >>
> >> > > > ...
> >> > > > > But the situation can be avoided fully, if TD preserving updat=
e is not
> >> > > > conducted
> >> > > > > during the TD build time.
> >> > > >
> >> > > > Sure, and the TDX module itself could guarantee this as well as =
much as
> >> > > > the kernel could. It could decline to allow module updates durin=
g TD
> >> > > > builds, or error out the TD build if it collides with an update.
> >> > >
> >> > > TDX module has a functionality to decline going into SHUTDOWN stat=
e
> >> > > (pre-requisite for TD preserving update) if TD build or any proble=
matic
> >> > > operation is in progress. It requires VMM to opt-in into this feat=
ure.
> >> >
> >> > Is this opt-in enabled as part of this series? If not, what is the
> >> > mechanism to enable this opt-in?
> >>
> >> For the information about how it works on TDX module side,
> >> please consult the latest ABI spec, definition of TDH.SYS.SHUTDOWN lea=
f,
> >> page 321:
> >> https://cdrdv2.intel.com/v1/dl/getContent/733579
> >>
> >
> >Thanks Elena. Should the patch [1] from this series be modified to
> >handle the TDX module shutdown as per:
>
> Hi Vishal,
>
> I will fix this issue in the next version.
>
> The plan is to opt in post-update compatibility detection in the TDX
> Module. If incompatibilities are found, the module will return errors to
> any TD build or migration operations that were initiated prior to the
> updates. Please refer to the TDH.SYS.UPDATE leaf definition in the ABI
> spec above for details.
>
> I prefer this approach because:
>
> a. it guarantees forward progress. In contrast, failing updates would
>    require admins to retry TDX Module updates, and no progress would be
>    made unless they can successfully avoid race conditions between TDX
>    module updates and TD build/migration operations. However, if such rac=
e
>    conditions could be reliably prevented, this issue wouldn't require a
>    fix in the first place.

TD build operations are much more frequent than TDX module update
operations. Retrying TD build operation will need additional KVM and
userspace VMM changes IIUC (assuming TD build process needs to be
restarted from the scratch). IMO, it would be simpler to handle TDX
module update failures by retrying.

Admin logic to update TDX modules can be designed to either retry
failed TDX module updates or to be more robust, adds some
synchronization with VM creation attempts on the host. i.e. I think
it's fine to punt this problem of ensuring the forward progress to
user-space admin logic on the host.

>
> b. it eliminates false alarms that could occur with the "block update"
>    approach. Under the "block update" approach, updates would be rejected
>    whenever TD build operations are running, regardless of whether the ne=
w
>    module is actually compatible (e.g., when using the same crypto librar=
y as
>    the current module). In contrast, the post-update detection approach o=
nly
>    fails TD build or migration operations when genuine incompatibilities
>    exist.
