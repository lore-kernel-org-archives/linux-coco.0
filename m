Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E934C3C3
	for <linux-coco@lists.linux.dev>; Fri, 22 Mar 2024 14:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711119432; cv=none; b=BeuHaVIFEm/tKkdbU08bjb/3/4xHrYtGWVR8c85Yvko8VAXt97E/27z7rUzR3MJcojb0PjbBLbWWuRj/4P+KVnhU9N39jZ8NsVXCRqD5ixB1s2ZHF0jSpruPIMPIUn22VdewSqLvX0fMRSQgopFOso76cHECVddsoG8sjb+xNys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711119432; c=relaxed/simple;
	bh=/f1CjCUjNQDtrSVcs8OwIAFG9Fo+Fj6rCq4U4CqaGBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mwNW7jIVMCPnSOd4y/t2ONq8/NBzqUqhV5mf2hbUQinb3dGYRYgqnnbCgO+K1YBKjt4gEzLjCjknNYXCc3RyPuNZzQO0MmXC9VsDhhYA91w60BN1qEW5PHTGh0bO0RBDJecmmgDZoI1Jrzx18fKMuApGtZd5iJ4hsqt9hTmeFeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YHnVOtME; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YHnVOtME"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-56beb6e68aeso3210a12.1
        for <linux-coco@lists.linux.dev>; Fri, 22 Mar 2024 07:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711119428; x=1711724228; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqoXqhs7mdqcvmYl5fT4D/wfQKYw/+AMQ460OJ7k560=;
        b=YHnVOtMEVV0cf2R0Gm9T2J4eAXq0iEDssQLspVqi9vX87kq8v82DX0UAoqAsDFVOjs
         lOHnDWv2/S20pYB8T1E7BUx0H5JrxE8mScPUTLhwZZC2b2mYp7Cx2kxfEqtOqqM5p9HX
         CGUIdlgsDcHRCi66yKAYXubQWgpaia4Ag8Gir87KWDxnrO2EZJc41JbFXy/kqjJ41wSb
         Q8bsUmo676ua2f0+uxqMjVkF9l9d0zpA4bLmKeItEhZMF61doj1JG8km8jmMQkSPQ7Np
         bkozcrHSX+lBfNoRlv8sID4kW9U+jow9b2JByaadL98MWmOvlwSG4zfFryDK6jY0ixlM
         SHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711119428; x=1711724228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqoXqhs7mdqcvmYl5fT4D/wfQKYw/+AMQ460OJ7k560=;
        b=F9c5O9AXHCo/NuqrZYs3lMjOZ4QP7y16xwOcb26qHsfsCCpyAsOQcUrGK1jd/+UZGl
         GW/ojSDtl6NNGiyBMVmibijFBJSkAHxiw9xjhF58t0VWJ83+Hjw3CWQm2F+1APvVctp8
         vw1De8/9yXNMDF3ViibB433rok8pG4syy4CMDaAWe7VzzNAZXBq8WPvSKzlJmiRc953D
         2lQoZ0jcnKe6mtMnxviBaCo7wRlQ9qDZCQ5pDVrpAqLXX6U7aoILOZvJVsQc3nC9mJIU
         bZsAU9aPNsUIbkhg1iwmqT4dD5UwVibFwAVx43KOk2fWQU+mAB2WMT2c1BKIbntZJxQp
         kwEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdRjioRAo2QN/OaIAHhdaHC0R0aNAE1VZGL/2oe+xFxH+QsiaEiBvb13em3hfupYxumqy5/Xp42TIMuyLGjXU+SihOHblIfGBH6A==
X-Gm-Message-State: AOJu0YxntLLE90Sh/ac+r5Wn3egFzP7OLgMdaW7FLzVO5kviRav4DWe5
	/uFy5OQyj0S/RwGe6qR4Sf/QpmTkr4P2s2mB3YEnd1VcWRSsvk4DnjpXD7er7z/UZTFYhL+tX+M
	OICdrcHS+tRPN0F7WkUz+7LPD+27fV2FLdfrl
X-Google-Smtp-Source: AGHT+IFOiWKhRImotom6fWI+3OgOejItV+EmnDvUyXMlFBabAf8s4wPRSFGts8XMn8rniX0yzs1g5+Xct/LW7mwt2ck=
X-Received: by 2002:aa7:c842:0:b0:568:ce1e:94e5 with SMTP id
 g2-20020aa7c842000000b00568ce1e94e5mr370371edt.5.1711119428110; Fri, 22 Mar
 2024 07:57:08 -0700 (PDT)
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
In-Reply-To: <u76teout4bwpg5yoklah6xfkrpcn4lw5nosw5lmph7sfjipqnz@gagzyh3xrkie>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 22 Mar 2024 07:56:53 -0700
Message-ID: <CAAH4kHbeGborxwDOzxeMbTjU4Xo79v-OVSHXYWQiJxg-yWQfWQ@mail.gmail.com>
Subject: Re: [RFC PATCH] OvmfPkg/SecurityPkg: Add build option for coexistance
 of vTPM and RTMR.
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: "Yao, Jiewen" <jiewen.yao@intel.com>, qinkun Bao <qinkun@google.com>, 
	"devel@edk2.groups.io" <devel@edk2.groups.io>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Aktas, Erdem" <erdemaktas@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Peter Gonda <pgonda@google.com>, 
	James Bottomley <jejb@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 1:52=E2=80=AFAM Gerd Hoffmann <kraxel@redhat.com> w=
rote:
>
> On Fri, Mar 22, 2024 at 02:39:20AM +0000, Yao, Jiewen wrote:
> > Please aware that this option will cause potential security risk.
> >
> > In case that any the guest component only knows one of vTPM or RTMR,
> > and only extends one of vTPM or RTMR, but the other one only verifies
> > the other, then the chain of trust is broken.  This solution is secure
> > if and only if all guest components aware of coexistence, and can
> > ensure all measurements are extended to both vTPM and RTMR.  But I am
> > not sure if all guest components are ready today.
>
> As far I know (it's been a while I looked at those patches) shim.efi and
> grub.efi have support for EFI_CC_MEASUREMENT_PROTOCOL, but use the same
> logic we have in DxeTpm2MeasureBootLib, i.e. they will not measure to
> both RTMR and vTPM.

Shim will measure into CC and then continue to measure into TPM
https://github.com/rhboot/shim/blob/126a07ebc30bbd203b6966465b058da741b2654=
b/tpm.c#L164

GRUB2 has the same behavior. We can at least get coexistence
supporting the current boot integrity strategy that Confidential Space
is using, which is to depend on a dmverity initramfs whose root hash
is in the kernel_cmdline, and a Linux kernel built with LOADPIN. The
changes to Linux are proposed but not accepted precisely due to this
conversation we're having now.
I recall describing this to another CSP engineer at an IETF meeting
and they claimed they used the same approach, but I can't remember if
that was Oracle or another company.

>
> Looking at systemd-boot I see it will likewise not measure to both RTMR
> and vTPM, but with reversed priority (use vTPM not RTMR in case both are
> present).
>

Interesting. Thanks for this report. We'll push for the changed
semantics here if the spec is indeed changed, and request partner
distros in the CCC to include the updated systemd-boot.
I think that since the current boot integrity story stops at PCR9, we
have time to update this component before the attestation method
evolves to support a less special-purpose system composition.

> Linux kernel appears to not have EFI_CC_MEASUREMENT_PROTOCOL support.
>
> > Since this option caused a potential risk / misuse breaking the chain
> > of trust, I recommend we have at least one more company to endorse the
> > runtime co-existence of vTPM and RTMR.  Also, I would like to hear the
> > opinions from other companies.
>
> Rumors say intel is working on coconut-svsm support for tdx.  That will
> most likely allow to use a vTPM with tdx even without depending on the
> virtualization host or cloud hyperscaler providing one.  We will see VMs
> with both RTMR and vTPM and surely need a strategy how guests should
> deal with that situation, consistent across the whole boot stack and
> not every component doing something different.
>

An ephemeral TPM that Coconut-svsm offers is qualitatively different
than the persistent TPMs in CSPs today. Users of Confidential VMs all
have different threat models that allow for trusting a CSP-managed
vTPM for sealing keys but not for trusting unencrypted data in use.
The boot stack attestation story will not be fully resolved for a long
while, and a smooth transition is better than a jarring one.

> Given that the vTPM might be provided by the hypervisor and thus not be
> part of the TCB I can see that guests might want use both vTPM and RTMR.
> So, yes, for that case coexistance makes sense.  I'm not convinced it is
> a good idea to make that a compile time option though.  That will not
> help to promote a consistent story ...
>

I agree, but it does mean we have to change the event log composition
to describe the configured measurement services like described above.
I think a static Pcd is okay to begin with. The idea for tracking
these qualities is through software supply chain endorsements.
Eventually that would look like the proposed in-toto's SCAI [1] but
until then we'd have a bespoke format that we document and integrate
with in an attestation verification service.

[1] https://arxiv.org/pdf/2210.05813.pdf

--=20
-Dionna Glaze, PhD (she/her)
