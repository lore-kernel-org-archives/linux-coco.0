Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BE2A920
	for <linux-coco@lists.linux.dev>; Wed, 19 Feb 2025 03:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739935298; cv=none; b=IWJxwqn6v9ZVN4Nons6G2VObB0Eg+z1HPlQ76SBhmRdjV8UrsaziVsLBQHiYZbRAQXGmLSycrdmSQ3H9o7/ctbNWUfVte1f5GKyIVPZMQnOcOFQwrwJY8qgw8HkXA9Dv4iTFScazhnkCItjZpgCZv/ro7ldfaGaZw7xjbXJCN34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739935298; c=relaxed/simple;
	bh=zQZ72noBMjWgnUpzvtmi4E18hq/KrvTADHps9Ta+qv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ColKSaDwlwnQKxiNiQkGpHHoMFKns6/cizOVd+gwQfCzv5L4U90+K4nJxZZNZKUgz0pNyH8L/ERwVQaHzbWeNewlJEyu9rQVyj0SlSjf4wlqTpC36s98kw+OdVj4H9K7zEmAoT9fgDLgU9sSgqN5ls1xWfaDiqynb+OBOi+c1sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pHJ8CdB7; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pHJ8CdB7"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e033c2f106so5613463a12.3
        for <linux-coco@lists.linux.dev>; Tue, 18 Feb 2025 19:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739935295; x=1740540095; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQZ72noBMjWgnUpzvtmi4E18hq/KrvTADHps9Ta+qv0=;
        b=pHJ8CdB7n9pb0cCOiywzF3kDi8G/cohAqbpRfahy1eri3s+XJI3ELdJk3YNgZt8WL1
         rSNKs08VoToIoy1kw2Qirx27VYu7WlkMGf/qNOMUopA8SXjhG2uJgTTYZrWAMAwP5gMZ
         jZoHr0eNY9r/MpGScZIEoRdbHB+QNYLxGfM6FeKWXL3WBfdSllN4oO4I/tciRNJJcOAR
         I/slfWGx7XoLppMV3QzEoJqQd8usxe9FGFljc6XgmR9MgfsVKFvVcb4RelKUUlwVGMQZ
         WT/3JLmmammmhzH82d4AbNUDoqZ0uXumr3j8IY/gyL5kYSzJKxmhIJlki5WXVheBJ2Sn
         CjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739935295; x=1740540095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQZ72noBMjWgnUpzvtmi4E18hq/KrvTADHps9Ta+qv0=;
        b=sbfhUhazzGG86jYLG3U/aeba0tcLGc83kSW8bWt9dvjsl6SeY3u0UYWsl49L3ACpBT
         pMZsuqJtvC4KFHQo/O5V5pu2l2IJRN0+KMuDfVG3c8LWyKfD27+goKfQHhkjSpAkrpyC
         wG8L7k7W0F9y85rF5ZRaDkcJ36DFYJMKJWifKvSSishkaHHuhtBf75jUWbn5upuBSwGx
         ++LvhRLfxyaq7gBBP2nb238bnVOJ/OQH3eQmUUroqtVGrZJCUWbIVxVoh9J7V5EyzYmw
         IbSZ23ALabS0etFp5Wal9Ay/eR10wRp6GcU5Icw//jq3X79ZHK62XJfNlYt33M59sLO8
         g+WA==
X-Forwarded-Encrypted: i=1; AJvYcCVqxBRjgOpelgbAtSLqb4Remi8U3tGWTihXdDVe+aUyflUkPBRJHf0LKWNc0ca3NeOq/lnDTix9YK4Q@lists.linux.dev
X-Gm-Message-State: AOJu0YzhZlw6d467fjxnsbrVxHN/9ZX9+tbwrQNLfgZtq8k38g3RXKQ4
	iAezM6vSMms99lN6I6TqCdXXhE9MqvB8FmcQwIWVWEqf27IefsqVJ92AYzfQ5FMkRW0WgvH+328
	5lUu2xs4gTph+XEUjjPhYWCqhK/n/MV90qu90
X-Gm-Gg: ASbGnctZE2DL/aScOEvrxl7w1vVRAlXiUCdkJ1KpEwTSF8xmWLJwlmMRJ0V3Cdf5odj
	njpQVKXb/Ox+dFUasr1BZZuoKC2rzVaswpnJpElQNMPzFA/v4IGjpMfx8DvenQC8eRohPhQJQ
X-Google-Smtp-Source: AGHT+IEnGbryBeBhChWrRvIMKHLS/nYVH9GuCmrhXCKrLhI46whs35vEsS7hGUKNaTHSWl6ye+CZMmasW6Vxzw7o0U4=
X-Received: by 2002:a05:6402:35cb:b0:5dc:caab:9447 with SMTP id
 4fb4d7f45d1cf-5e036063e6amr41083363a12.18.1739935295010; Tue, 18 Feb 2025
 19:21:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250212-tdx-rtmr-v1-0-9795dc49e132@intel.com>
 <15c69d57-4ffb-4ea1-8cbc-0ba6d3d7b14f@intel.com> <be7e3c9d-208a-4bda-b8cf-9119f3e0c4ce@intel.com>
 <015cdddb-7f74-4205-af8a-b15cad7ddc22@intel.com> <d8f3eb33-d902-4391-adc7-005e4895b471@intel.com>
 <c7894df2-2b27-4f67-b428-3eca312503f9@intel.com> <c2cf2184-7753-454e-ac99-8c4f3c9c3d16@intel.com>
 <01fc0997-a0e7-4086-b0aa-67b4a51b328a@intel.com> <12ed2ab1-e97d-4a20-8370-8c60cabffc77@intel.com>
 <ab2036d5-5b6f-4fa9-995a-fba63c0a5209@linux.intel.com> <f4d344de-70c2-4fd4-bb18-2912cf0f3f98@intel.com>
 <CAAH4kHYq7_3vLXQaCA7iKF+mC5Pg0cn-1FsB-iCbN7Jim9a-OQ@mail.gmail.com> <650b6236-50d3-4932-b5bc-056fd29c93a7@intel.com>
In-Reply-To: <650b6236-50d3-4932-b5bc-056fd29c93a7@intel.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 18 Feb 2025 19:21:23 -0800
X-Gm-Features: AWEUYZkxt4Uz_DEgnqnT-wIOC0NHjgfy5WtvAXnbdvc8enIGlu1IN6n1oU029Q4
Message-ID: <CAAH4kHYye2ApqYb3GmHSt2Ge4B1m55mA54Ch-f1RCzh3GZuHOw@mail.gmail.com>
Subject: Re: [PATCH 0/4] tsm: Unified Measurement Register ABI for TVMs
To: Dave Hansen <dave.hansen@intel.com>
Cc: Dan Middleton <dan.middleton@linux.intel.com>, "Xing, Cedric" <cedric.xing@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 4:41=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 2/18/25 15:57, Dionna Amalie Glaze wrote:
> >> If there are actual end users who care about this, it would be great t=
o
> >> see their acks on it as well.
> >>
> > We would like to have this for Google Confidential Space and Kubernetes=
 Engine.
> >
> > Acked-by: Dionna Glaze <dionnaglaze@google.com>
>
> Great! Thanks for chiming in. Can you talk for a second, though, about
> why this is useful and how you plan to use it? Is it for debugging?

Confidential space on SEV depends on the hypervisor-provided vTPM to
provide remotely attestable quotes of its PCRs, and the corresponding
event logs.
https://github.com/google/go-tpm-tools/blob/main/launcher/agent/agent.go#L9=
7

On TDX and ARM CCA (maybe RISC-V CoVE someday), we don't want to have
to depend on the vTPM.
There are runtime measurement registers and the CCEL.
When we have a sysfs interface to extend these registers, it makes the
user space evidence manager's life easier.
When Dan Williams forced the issue about configfs-tsm, we were told
that it is bad for the kernel to have many platform-specific
interfaces for attestation operations.
This patch series is a way to unify behind the tsm.

As for the ability to read the registers through sysfs instead of just
extend-on-write, that's not something Confidential Space depends on
specifically.
Our attestation policies are evaluated in a verification service
rather than on-node.

For on-node policy evaluation, for instance in kubectl, there is a
benefit to being able to generically read measurement registers that
have been extended generically to execute policy that a certain action
if a measurement register isn't an exact expected value.
This is not far-fetched, since it is used for confidential containers,
and is being discussed for kubernetes engine as a way to poison an
instance when an ssh session is terminated for a human operator.

To have that same capability without a generic read interface, we need
to stuff kubectl with quote parsers of every attestation technology.

Hope that helps.
--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
