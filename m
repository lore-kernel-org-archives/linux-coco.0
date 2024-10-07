Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1AB15B12F
	for <linux-coco@lists.linux.dev>; Mon,  7 Oct 2024 19:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728330225; cv=none; b=gWUI24m+/UNJb1sgP17GlzyW31LCJKT/IADvRcMNErdEMTjx752Z8Xee4rOtgYoMcXEC3f2+ldE5TboT/5Svjfxwe1MoEfEEB5pxF7ndaJ2ZJy/pXE6QKjMKTth53CIx1HytFZwCzX7gNu53+2oAQMcE+M/YROVcwYe0soXX8JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728330225; c=relaxed/simple;
	bh=XIhcAQGy/2QO/YR8jgkvXJOuUU0CPFvNUecAXBmURjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DgpvISiprGPyQG+Xh1vtyFrZ1OvEf0xyEuP6AANl8Dg30eA/r30zcaQWRiyGITO+eiFhHfku+8uOK1JJiB2s2G+MW9ujjEG0RykQdTTkWHBmT5z1KhBpx2ktWFYuBwdQYWdaa8TEwPgFJnndpR8P4IR1ysrpXHHegRdNZsJ58/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wECds3gx; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wECds3gx"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7db90a28cf6so3900692a12.0
        for <linux-coco@lists.linux.dev>; Mon, 07 Oct 2024 12:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728330222; x=1728935022; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXVpFf71Nqc4COrVw9u262XiE3tVZ50EDZqO6R8MafY=;
        b=wECds3gx9XNhHGwzoML/oNXRhcQwccU2jxhJFGjg/yCDPOGvrap0TJNQYJgnve0i+w
         5Q4XtNw2rGP1LkJ3T7GghyIg8rNNeUAS5x7IUOVwtAuJQ5hW8+uPsudEAbCGjIbq8LvM
         3wL/f3sD7Pcth4G1/cTAvOv9lCz9NPlV0wvvEzqNKbrL0dmPHSli5MBPHNR4xQOXAmF1
         P04UU4+R1V3rglJtT/OBHUszoj+L/y1dOhW4dkx7Rwe/2+57eMWoPpaVBnSipIfBOc4Q
         FZGQoKcOxuxic4oCWjSDNtdjAzC7lxAcI5D9/UbJ0t6JKw7vFxYJcdKWndg0qFAi+mXf
         XG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728330222; x=1728935022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FXVpFf71Nqc4COrVw9u262XiE3tVZ50EDZqO6R8MafY=;
        b=Pipity6BMDkrnBzP1kllg1qUDiSqI6QFmsnakABIeozoNY6oBp9Ukq0RTNvagzMIks
         nK6O7EFvAzTwoxaY+RXZxXRvdgg2XIuFzXPXloJIHDdaTB8DtHjADs7ZVMTLIvx3f5RI
         glMAya/eC/5dmqg4+bFBGUxhNTrQe0ycATuA6TI202gJz5jCU7tA10gTkcfaNA8oKelI
         JY5LL1CJuEB5AHjiRs4XiXRHHVdVAKwkQwI7vD4Oold8dUBL8xCvKF3KBM3XLkdBLSc+
         kehfNRwU4ugrgA3/BGGfu4i2Vqmn44y9jQ5HijbnIyaKHfzZ/0qaiU+c9NeI/EoLSnj1
         MQhw==
X-Forwarded-Encrypted: i=1; AJvYcCWpc2aDd1Uc7c5X1rrdQV16lK/ic22PJXhiqXt1Z1ppMMSZPdbDr03O++jyK7ATL4W26Wove1fLRPXw@lists.linux.dev
X-Gm-Message-State: AOJu0YyTNtvqtmovWcnpu87Rdi4ggdEylS/JXWR9Jrl20++eU6s79lSd
	xYgRhFRNSzjhNf07KapCah9aFmidITIwUBm5YBg1K0XPt1ANsZvzGaDfmREYEwkHHg6cEcqgWiX
	xpCwHAi7xyTZgVhv2maXNJTO6HqwRsXfr2jXn
X-Google-Smtp-Source: AGHT+IGHJZ9bWMAzccJj9Mg3/DS+ySFYlpV6P8ZwSSjmK2M6WUJxkDnp2Co1xdweMB+NREgNtwMloD5p/0FFLXRXdcE=
X-Received: by 2002:a17:90a:db8d:b0:2d8:9fbe:6727 with SMTP id
 98e67ed59e1d1-2e27dd46589mr1181809a91.4.1728330221747; Mon, 07 Oct 2024
 12:43:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <172618715121.516322.9909313629463814714.stgit@dwillia2-xfh.jf.intel.com>
 <172618718534.516322.14804707935022669853.stgit@dwillia2-xfh.jf.intel.com>
 <665c5ae0-4b7c-4852-8995-255adf7b3a2f@amazon.com> <67005fcf46742_10a0a2945@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <5d1da767-491b-4077-b472-2cc3d73246d6@amazon.com> <94d6047e-3b7c-4bc1-819c-85c16ff85abf@intel.com>
 <67042f7b5203b_964f229455@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <67042f7b5203b_964f229455@dwillia2-xfh.jf.intel.com.notmuch>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 7 Oct 2024 12:43:26 -0700
Message-ID: <CAAH4kHa=iboFBqdXx9BJA_L54v+ABHjYy3viQSCs3Q-DWXTq8w@mail.gmail.com>
Subject: Re: [PATCH 4/4] configfs-tsm-report: Introduce TCB stability
 enumeration and watchdog
To: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Alexander Graf <graf@amazon.com>, linux-coco@lists.linux.dev, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, "Borislav Petkov (AMD)" <bp@alien8.de>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Michael Roth <michael.roth@amd.com>, x86@kernel.org, aik@amd.com, 
	elena.reshetova@intel.com, pgonda@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 11:59=E2=80=AFAM Dan Williams <dan.j.williams@intel.=
com> wrote:
>
> Dave Hansen wrote:
> > I figured I'd just write down what I think is the contract that we're
> > trending towards:
> >
> >  1. Attestation includes a snapshot of the TCB, which includes the TDX
> >     module and microcode versions.
> >  2. There is a record made of each attestation which includes those
> >     versions.
> >  3. The machine owner is in control of the components of the TCB and ma=
y
> >     upgrade the components to a later version at any time but can not
> >     downgrade them.
> >  4. If there is a security regression in a TCB component (say microcode
> >     version $V), any TD that ever attested with microcode version $V or
> >     any earlier version should be considered exposed to the regression.
> >  5. The attestation record is the sole means of limiting the scope of
> >     the impact from the regression.
> >
> > The subtle part of that is that the attestation really isn't for a
> > single version.  It's fundamentally for that version or any later futur=
e
> > version of the machine owner's choosing.
>
> So, in summary per Alex's last note: "there is no operationally viable
> way to be a confidential computing tenant in the cloud and distrust
> updates from the platform vendor deployed at will by the cloud
> operator".
>

Yes. This is also the AMD trust model.

The TCB_VERSION is tracked and included in the key derivation function
for the attestation key. The REPORTED_TCB is what is used to derive
the attestation key, and it can only be UP TO the committed TCB
version. You can be artificially held back to an old VCEK but still
see what your current and committed TCB versions are.
On TDX you can update your microcode and I'm not clear if CPUSVN is
changed subsequently or if you have to run EUPDATESVN first, but there
is a similar delay between updates to TCB and updates to attestation
keys (and certificates).

The microcode, PSP bootloader, TEE component, and SP firmware all have
their own individual security patch level (security version number)
that may not be rolled back by any of the component hotloading
features.
The SEV_CMD_DOWNLOAD_FIRMWARE_EX command will fail if the SP firmware
svn is lower than the committed firmware's svn.
The amd-ucode loading MSR_AMD64_PATCH_LOADER can only add patches. It
cannot remove them. I haven't inspected the other components' late
loading abilities.

The current, committed, reported, and launch TCB_VERSION values are
included in the attestation report to show TCB version change status.

If you want to know about updates before they're rolled out, you can
get on the AMD DevHub provided you have an AMD contact to grant
access. I don't imagine that CSPs can execute on full qualification
and rollout of a new firmware patch within 2 weeks either.

--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
