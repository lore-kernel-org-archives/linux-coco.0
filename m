Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AF813D88D
	for <linux-coco@lists.linux.dev>; Thu, 11 Apr 2024 06:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712818351; cv=none; b=aI8gYnYWgczu/1hCVd6TMbHxm8qzrLJjNqAsWnNPe6Dy8EwMwF+81vuNGt4aUgCHACx46/Aow969trJsQfWHPwJorLYg0UyGQj9CwSjI0ML93JT+/pticgOnThsh4TVd1N8MtE+x/4KnEr6t5+NOczhq992JRc6idQCQzLD9wwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712818351; c=relaxed/simple;
	bh=ghnELJC0GfTCfK7ElI0acGLPWYIYIMMYR/SOyJ8s+2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tXDtY4TnwbRw7jWG5kT8ik3O2AwRHfctGxs5tsk8fQpX2USX1/FGbHTioXAKmUKMs8qbDX9pT6H5D5PYCONRPgkXpuJlLuQU24No/j7hY+F0FjCdpZ6ASdxS732Pv0CwFw8O5eRqbA2y8HN9TOkD1JQhgLXDLRxunclHyBJP0j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2tWTta0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2tWTta0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1452EC433F1
	for <linux-coco@lists.linux.dev>; Thu, 11 Apr 2024 06:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712818351;
	bh=ghnELJC0GfTCfK7ElI0acGLPWYIYIMMYR/SOyJ8s+2k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K2tWTta0VFWOefGZt8EYsGKpYoHBIKZyLwplMG/uFE55DZVTghZiDAtcLjcJusaWG
	 jzq6Awe3v4VLi43//npdhjxPfGgZK9FWQ0LxzB5yDqqHlrfoIdIXZ9eTcFm14zLczO
	 p3vXuWMTbTyy4UWvUk3MB2FsaYZmBldF5/5LI6+SEOK/n1Jn4j1eXeieD9d47dh0cB
	 dtAOyctSqFFPi7FTa5LwaGhvBo4xHCRCchYegU4s70m6P3Nx3eJ7VVoxQg+YVXvfnb
	 uLjihg/+0DKlJElieLGx3+tYwKUXzzUlerNoLTGtXAbDfiBlXFTwFNPba23v85Khw7
	 opdXft3DIn80g==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d4979cd8c8so5509351fa.0
        for <linux-coco@lists.linux.dev>; Wed, 10 Apr 2024 23:52:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCViIJyBTrI1EmZY9Lp372lNlnnawyBF6TNz9RGjXMK1D+Jz/D1keJ2HOwplYfLNmnBaphBjy2fDDVWV8n+2dF2Soso1VV78k71HPw==
X-Gm-Message-State: AOJu0YxWkIF0szFK4Hj6uiXhjoJ19wovHmlxoALjA13sdDNyG+dGHHCw
	bMdzJAO20w0cziHb2+hV56l1yB6kx3lv0q2JmT5tI2X3X5xUpRiQa0hPIuTwqiRVsL8o0pfSimR
	oZANlu0W/WNsDMwuJ3InID2yH974=
X-Google-Smtp-Source: AGHT+IFKDCw/NSdLmra/1Cj8XpPZCTo+x6Gzw8roXQU3rVSRa81n5/yBGik2741Mk2eI8JxzAOtNrJ7O3LQGGJkdBUE=
X-Received: by 2002:a05:651c:4ca:b0:2d8:c9f:59fe with SMTP id
 e10-20020a05651c04ca00b002d80c9f59femr576484lji.12.1712818349369; Wed, 10 Apr
 2024 23:52:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <94521f20aa2872c1b8f018b7db31eca4a2b8222d.1711039409.git.qinkun@google.com>
 <CAAH4kHbAi=Jn7Lw82idGGmQYnAhJnhoS9u8wBMOZsp7iLiOWxw@mail.gmail.com>
 <PH0PR11MB587959168F72B20E0AC836438C312@PH0PR11MB5879.namprd11.prod.outlook.com>
 <u76teout4bwpg5yoklah6xfkrpcn4lw5nosw5lmph7sfjipqnz@gagzyh3xrkie>
 <CAAH4kHbeGborxwDOzxeMbTjU4Xo79v-OVSHXYWQiJxg-yWQfWQ@mail.gmail.com>
 <ZgF3ACjFj8LtUWgv@himmelriiki> <CAAH4kHbqpaCgZJpF55x2NGWL22rz1ucRewYmR=K2chw2kP6sKA@mail.gmail.com>
 <MW4PR11MB5872BBA0D379C40E071300B98C052@MW4PR11MB5872.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB5872BBA0D379C40E071300B98C052@MW4PR11MB5872.namprd11.prod.outlook.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 11 Apr 2024 08:52:18 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGm5RPNAzshaTAb7fnB80m8S+q0gbNxWSA3i9Dp-AL8uw@mail.gmail.com>
Message-ID: <CAMj1kXGm5RPNAzshaTAb7fnB80m8S+q0gbNxWSA3i9Dp-AL8uw@mail.gmail.com>
Subject: Re: [edk2-devel] [RFC PATCH] OvmfPkg/SecurityPkg: Add build option
 for coexistance of vTPM and RTMR.
To: devel@edk2.groups.io, jiewen.yao@intel.com
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>, Mikko Ylinen <mikko.ylinen@linux.intel.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, James Bottomley <jejb@linux.ibm.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, 
	qinkun Bao <qinkun@google.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Aktas, Erdem" <erdemaktas@google.com>, 
	Peter Gonda <pgonda@google.com>, "Johnson, Simon P" <simon.p.johnson@intel.com>, 
	"Xiang, Qinglan" <qinglan.xiang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

On Thu, 11 Apr 2024 at 03:20, Yao, Jiewen <jiewen.yao@intel.com> wrote:
>
> Hi Dionna/Qinkun
> I am not sure if systemd is the last software in guest we need to patch t=
o support coexistence to extend the measurement.
> Are you aware of any other Linux guest software needs to be updated? Such=
 as Linux IMA (Integrity Measurement Architecture)?
>
> To move this forward.
>
> In Intel, we had discussed and we did see the potential security risk. As=
 I mentioned in the first email, "In case that any the guest component only=
 knows one of vTPM or RTMR, and only extends one of vTPM or RTMR, but the o=
ther one only verifies the other, then the chain of trust is broken."
>
> At same time, we also respect that it might be a valid use case for Googl=
e.
> I would like to ask the opinion in the EDKII community, especially the OV=
MF and CC maintainer and reviewer.
>
>
> Hi Ard Biesheuvel
> Do you think Kernel is OK with this coexistence proposal?
> Are you willing to give "reviewed-by"?
>

I think it is a bad idea to go and apply changes all across the boot
software ecosystem to measure the same assets into different
measurement protocols. I'mm afraid it creates technical debt that will
come and bite us in the future.

Given that RTMR is a proper subset of vTPM (modulo the PCR/RTMR index
conversion), I feel that it should be the CoCo firmware's
responsibility to either:
- expose RTMR and not vTPM
- expose vTPM, and duplicate each measurement into RTMR as they are taken

However, I understand that this is only viable for execution under the
UEFI boot services, and after that, the vTPM and RTMR are exposed in
different ways to the OS.

Could someone explain how that piece of the puzzle is supposed to
work? Do we measure into RTMR after ExitBootServices()?
