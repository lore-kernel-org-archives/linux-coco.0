Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95B621A431
	for <linux-coco@lists.linux.dev>; Fri, 20 Dec 2024 16:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734711914; cv=none; b=khBIveGPU7VdXSm9G8cU1fjOM1vTwISIE5lcfK26/h1eAkdiJ7yTqVb0TxFxB38hrQeL6iIqJgcacSdcTkKY5bdKvNo+N0p8lzYCvaO9CFHfGX6qDTZHJT6DScoD0sn7KtRLCCyy65YpiqPfzeB68SvDjCNqp2SdEaDthjBX9Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734711914; c=relaxed/simple;
	bh=iub0dcjRwS7n/viBTUfP3zzXsX0B5mXaAhBSy5ZWQto=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NGLIfAwsUhHI1wZNl+TI8Pnrxgvh03d9plWPB3rsj4g0+7Ugr+VVH1QxIjl+gTFCSeAEaha8/JLwJPtoDFv1COiy9tdVbdfrU7GOgLbs9ge9DM6gwZWbSigHI1zSDtBErqxjk8ENEHAY3wSGjFiW0IsNqm/GzpFLdmAbf5hwovc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BqU4/1m8; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BqU4/1m8"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7e9fb5352dfso1946094a12.3
        for <linux-coco@lists.linux.dev>; Fri, 20 Dec 2024 08:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734711912; x=1735316712; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLCijHqEgWqnuaOBsv7OhtW6DuFNGcPyjKp1uoSIRX0=;
        b=BqU4/1m8O8hg6pWoxc5h0Qzl8ahIUs/k+Eg4Z46Rkk7f4Mf2cOOYf8og9KFbkBM54r
         mCCXJervi9JUQ9FKif5VPde3EMHCGVgEqfgAtuQ6cW+LjhbOWkSIt/CxxcFr00OPMc8d
         jipS+cGMZEULSPijyAdVKmVjJoMsKXcHYFUVl5mrA31FU+Gv2KG+sl8gfpj9xWxe2fjM
         k6hgkf5NBUzJIKzgODCa7LMFUegJa8ISqbswwzA2pO7a1773JT8CXlEAH5agw4MYwiFa
         g/SoP7wgUC+XmjnX1+GTHpc8hMoWJZYdN35bU04fQfYFTzM7dV51fa9vKMzXFi65qsms
         fk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734711912; x=1735316712;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eLCijHqEgWqnuaOBsv7OhtW6DuFNGcPyjKp1uoSIRX0=;
        b=McZN5TzM6E5QNMwKof/X9JBrc6YFyC7yAQWjfGjY4po8qMPhL0qBm4lVvj8G38M21t
         0f6oQn2zOX0OQKVbgl6AouZMRpqiTXrdkyZHPURdQnTrsSZEg5oIkx4IvZfBaYga3dBC
         jbzlSwYlJgGwGc4zs1+Akvm0UgAT4iZbSg5imdQVY7oPBpI2LtS34/ZatjomyoS9mhzq
         AkHHX9bBVhWUoDYlFlXrCuCmk7EC5Ry1bu5gz29PC4vOIWBWMn/b73qkvH81GjClAW3r
         gzu29bn5yX3A8AziI1pAK9en4bnynRK+yqP6zZ7qLmGWNdI8BNE0NVYwad8foIfITOz7
         cOrg==
X-Forwarded-Encrypted: i=1; AJvYcCVJxL/iXWnQWI3CC9bhsZGRNZBREuFAWPiqkIQEoITiZiKZYdkK8COE9VtNYxvV4cU3lDU0Md/sQrTH@lists.linux.dev
X-Gm-Message-State: AOJu0YxuCy2hAc4t3ehE4Z+lEN2egj7RHJG9KUL8FNveSh9ilyHxoQM4
	7k4zeaY+/DzvAgiGkRXXWwjsk+JXt/fqA9YaKhT6gd4sjAOrjyvbjfDdqmfRd35hCNbOlzmQH5B
	meQ==
X-Google-Smtp-Source: AGHT+IHoBHUmeDEVN53khNakWATzKl/ZCvRIPz/sAopfe6VES86j2gkyd/p6MCVXr+0GpIvjuBy9uC4tBLU=
X-Received: from pgtq13.prod.google.com ([2002:a65:684d:0:b0:802:81:dd47])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6da4:b0:1e1:e2d9:7f0a
 with SMTP id adf61e73a8af0-1e5e0802525mr6970765637.34.1734711912161; Fri, 20
 Dec 2024 08:25:12 -0800 (PST)
Date: Fri, 20 Dec 2024 08:25:10 -0800
In-Reply-To: <Z2UvlXeG6Iqd9eFQ@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1734392473.git.ashish.kalra@amd.com> <CAAH4kHa2msL_gvk12h_qv9h2M43hVKQQaaYeEXV14=R3VtqsPg@mail.gmail.com>
 <cc27bfe2-de7c-4038-86e3-58da65f84e50@amd.com> <Z2HvJESqpc7Gd-dG@google.com>
 <57d43fae-ab5e-4686-9fed-82cd3c0e0a3c@amd.com> <Z2MeN9z69ul3oGiN@google.com>
 <3ef3f54c-c55f-482d-9c1f-0d40508e2002@amd.com> <d0ba5153-3d52-4481-82af-d5c7ee18725f@amd.com>
 <Z2UvlXeG6Iqd9eFQ@redhat.com>
Message-ID: <Z2WaZvUPYNcP14Yp@google.com>
Subject: Re: [PATCH v2 0/9] Move initializing SEV/SNP functionality to KVM
From: Sean Christopherson <seanjc@google.com>
To: "Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?=" <berrange@redhat.com>
Cc: Ashish Kalra <ashish.kalra@amd.com>, Dionna Amalie Glaze <dionnaglaze@google.com>, pbonzini@redhat.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	thomas.lendacky@amd.com, john.allen@amd.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, michael.roth@amd.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024, Daniel P. Berrang=C3=A9 wrote:
> On Thu, Dec 19, 2024 at 04:04:45PM -0600, Kalra, Ashish wrote:
> > On 12/18/2024 7:11 PM, Kalra, Ashish wrote:
> > > But, i believe there is another alternative approach :=20
> > >=20
> > > - PSP driver can call SEV Shutdown right before calling DLFW_EX and t=
hen do
> > > a SEV INIT after successful DLFW_EX, in other words, we wrap DLFW_EX =
with=20
> > > SEV_SHUTDOWN prior to it and SEV INIT post it. This approach will als=
o allow
> > > us to do both SNP and SEV INIT at KVM module load time, there is no n=
eed to
> > > do SEV INIT lazily or on demand before SEV/SEV-ES VM launch.
> > >=20
> > > This approach should work without any changes in qemu and also allow=
=20
> > > SEV firmware hotloading without having any concerns about SEV INIT st=
ate.
> > >=20
> >=20
> > And to add here that SEV Shutdown will succeed with active SEV and SNP =
guests.=20
> >=20
> > SEV Shutdown (internally) marks all SEV asids as invalid and decommissi=
on all
> > SEV guests and does not affect SNP guests.=20
> >=20
> > So any active SEV guests will be implicitly shutdown and SNP guests wil=
l not be=20
> > affected after SEV Shutdown right before doing SEV firmware hotloading =
and
> > calling DLFW_EX command.=20
> >=20
> > It should be fine to expect that there are no active SEV guests or any =
active
> > SEV guests will be shutdown as part of SEV firmware hotloading while ke=
eping=20
> > SNP guests running.
>=20
> That's a pretty subtle distinction that I don't think host admins will
> be likely to either learn about or remember. IMHO if there are active
> SEV guests, the kernel should refuse the run the operation, rather
> than kill running guests. The host admin must decide whether it is
> appropriate to shutdown the guests in order to be able to run the
> upgrade.

+1 to this and what Dionna said.  Aside from being a horrible experience fo=
r
userspace, trying to forcefully stop actions from within the kernel gets ug=
ly.
