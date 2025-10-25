Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B624F1EF39F
	for <linux-coco@lists.linux.dev>; Sat, 25 Oct 2025 00:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761353696; cv=none; b=N88LDW89K8ccw2+V/AVIJPAPZCpuASIHlR2sGZbqKps7D6N3zk8yyepK+BB9+/+aSJjJCs5/Fgwf1HNkdSpm2KN/IuQk7l7O+pAtN1v4FHANoUz6gy7TkW2NHkG2Z98d9bSy1447NFH76vmiuywHdGPJcZ8LKFuwpS5Dmp9QNZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761353696; c=relaxed/simple;
	bh=FAa8qh/yrZ/DivWv0HekP569K1EcOK1GynHOSo9ol4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qhd8PUz2Hojw4DKCJDhAF1VbkIP9z4UwnW1na3L7opp618j4pJczqhcnfpDYMbtHjnh38KOrSt/IP5o9oPRD+ZigCPK7+0OM+T7cZZh0BzUeytYWRbHkp1HDyJnaHPfoIVXv4KaeX1IRdVkAFPD+akn0sSsLJ2pHc6hhistWRUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AlXYA8dG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AlXYA8dG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-27eeafd4882so86025ad.0
        for <linux-coco@lists.linux.dev>; Fri, 24 Oct 2025 17:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761353694; x=1761958494; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAa8qh/yrZ/DivWv0HekP569K1EcOK1GynHOSo9ol4g=;
        b=AlXYA8dG1GuFMQPIYEtTDpEaMEQc5z2l8kEGJiscSC40ibtwc0Das3Ojf3sjPejjT9
         VOjXf1tWs8uWojqEbt8TV5Iuocicgn76foUvJMKsaXEFbdPDurxoMJ1DSF9fKAI5w3Nh
         cc+XFFSHjziZD0SgQhwKOQDYd9Rw3z22tCwmH/201dfZuh1zPeNqRdZUZ948PBHCPi/a
         44lyCczydWOjxKjONjQ1sn0BXxz8vVkB96lTvDl1mIirWbxgiyrI1FbEPoPwEXBtSWir
         E5osMtHx2/6JS7P1oJEWbp4J2i6ZOpJVT3sJyUS/OmjqcucdsWMTpsewOAMD8j9/yAcw
         AoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761353694; x=1761958494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAa8qh/yrZ/DivWv0HekP569K1EcOK1GynHOSo9ol4g=;
        b=DWJELyC9GU4QCEf0TuMWn3k2v2QOm9VKpK/gF4yApBMIv0xPbrJ4EOK6x+CGEiDjEi
         GMEwPiHjtVJaooNQCpyVHRd7w83q728boC++/TDWn0lyvASCK0dLbRXsg4mFiGZEQ1rn
         2yuQLSHepHWvmAlCgDGYE3OlkpJLbC4OOnSSSKPyblWU6YaSTbRCFdQPgrE6uSOvcvb3
         cYilkR/dbzqaTUz7klHh4w9qWp9Z5n6orjJpk3SOjdIpgAYIp+RawxM5DnniXOy4r13r
         SSwhmn85+tKR9p9UhaNRyLXtcJ3lnYfL/v75UmRM6+fTPQFF0vRTl7p3COqIqSuXZ/vy
         2O4w==
X-Forwarded-Encrypted: i=1; AJvYcCWyEiTA7TnzqaX+A+TbPRJqCKt9kSO/nq2KuyS78+qXaftxx9Q9hxqLEmtD/ouCMZwbOVjv0Vcd8kv9@lists.linux.dev
X-Gm-Message-State: AOJu0YwqKlV4n9izY/sxcsQPXxrFTiT1feID8q+ARmThBNhVKMDl1Wag
	EirGrMzuT8auOTvu+bTDj9TGUNL7ZZuzfnkoNfuT2+sur//fMhAOXMr1qH/Pp/REUUDRWNd1X12
	4Oig++ycev0sqWhIUAEZYsB1JBI+23MMIb9kfvQG7
X-Gm-Gg: ASbGncsds4fvQI40rwDmrcYnV/dNMxyXMJAa47FgW00CLMVyEsHHzoNbstzh4lHHgmy
	p6qGGGMElawolUktmpX3AYNnD6vhr06mIR+c+LnviE8HaOhHFh/HquO/GQVN7+cQ6XeDdlGLGzN
	qWPbxphxc8Y6NDL6ck0L8aFzgUjXBnCc+6s6fVQd2mMCjiXnzLl/EQiSA3AAjX+A+NRRnKlopdQ
	vL6rX59ww/wZfauqtJ4lDJRUe3vzmb+mqnmhqFpI+4/aD2AUto63GwpUWmVLR27wMh3ozcOPkWl
	v5B3yS6cqLJ4Q3+v
X-Google-Smtp-Source: AGHT+IHAZ97kNRS6LIm17OkKE+WVWsFtHlMK6rPjrAsP/+pfRZatmLGaC4FeacAc9nw5mRAZKQnmr9bJJldNrkXuH1Y=
X-Received: by 2002:a17:902:ce84:b0:274:1a09:9553 with SMTP id
 d9443c01a7336-29497bb4f1amr2404035ad.6.1761353693538; Fri, 24 Oct 2025
 17:54:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <IA1PR11MB949522AA3819E217C5467B51E7E8A@IA1PR11MB9495.namprd11.prod.outlook.com>
 <5b4c2bb3-cfde-4559-a59d-0ff9f2a250b4@intel.com> <IA1PR11MB94955392108F5A662D469134E7E9A@IA1PR11MB9495.namprd11.prod.outlook.com>
 <CAGtprH96B5K9Hk5h0FgxSUBa-pik=E=dLrO-4oxx76dxb9=7wQ@mail.gmail.com>
 <IA1PR11MB9495BB77A4FAFBD78600416AE7F6A@IA1PR11MB9495.namprd11.prod.outlook.com>
 <CAGtprH-h_axusSLTWsEZ6QoxgmVs0nVknqNJx-iskpsg_qHKFg@mail.gmail.com>
 <aPiEakpcADuQHqQ3@intel.com> <CAGtprH8q5U6h3p5iDYtwRiyVG_xF8hDwq6G34hLt-jhe+MRNaA@mail.gmail.com>
 <CAGtprH9bLpQQ_2UOOShd15hPwMqwW+gwo1TzczLbwGdNkcJHhg@mail.gmail.com>
 <aad8ae43-a7bd-42b2-9452-2bdee82bf0d8@intel.com> <aPsuD2fbYwCccgNi@intel.com>
 <ca688bca-df3f-4d82-97e7-20fc26f7d69e@intel.com> <68fbd63450c7c_10e910021@dwillia2-mobl4.notmuch>
 <2e49e80f-fab0-4248-8dae-76543e3c6ae3@intel.com> <68fbebc54e776_10e9100fd@dwillia2-mobl4.notmuch>
 <10786082-94e0-454e-a581-7778b3a22e26@intel.com>
In-Reply-To: <10786082-94e0-454e-a581-7778b3a22e26@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 24 Oct 2025 17:54:40 -0700
X-Gm-Features: AS18NWD48cIVeisP_Vz7McnMgruGX1KZ_wuEbrM37xSeUhKYSGdaLBQqN8lJETQ
Message-ID: <CAGtprH8AbW4P2t-wHVcTdfLwf3SJK5mxP1CbsMHTgMYEpLiWjQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Runtime TDX Module update support
To: Dave Hansen <dave.hansen@intel.com>
Cc: dan.j.williams@intel.com, Chao Gao <chao.gao@intel.com>, 
	"Reshetova, Elena" <elena.reshetova@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	"Chatre, Reinette" <reinette.chatre@intel.com>, "Weiny, Ira" <ira.weiny@intel.com>, 
	"Huang, Kai" <kai.huang@intel.com>, "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, 
	"sagis@google.com" <sagis@google.com>, "paulmck@kernel.org" <paulmck@kernel.org>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 2:19=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 10/24/25 14:12, dan.j.williams@intel.com wrote:
> >> The SGX solution, btw, was to at least ensure forward progress (CPUSVN
> >> update) when the last enclave goes away. So new enclaves aren't
> >> *prevented* from starting but the window when the first one starts
> >> (enclave count going from 0->1) is leveraged to do the update.
> > The status quo does ensure forward progress. The TD does get built and
> > the update does complete, just the small matter of TD attestation
> > failures, right?

I would think that it's not a "small" problem if confidential
workloads on the hosts are not able to pass attestation.

>
> Oh, yeah, for sure.
>
> If we do _nothing_ in the kernel (no build vs. module update
> synchronization), then the downside is being exposed to attestation
> failures if userspace either also does nothing or has bugs.
>
> That's actually, by far, my preferred solution to this whole mess:
> Userspace plays stupid games, userspace wins stupid prizes.
>

IIUC, enforcing "Avoid updates during update sensitive times" is not
that complex and will ensure to avoid any issues with user space
logic.
