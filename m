Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7E453366
	for <linux-coco@lists.linux.dev>; Wed, 21 Feb 2024 12:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708518287; cv=none; b=BgVehTLD0zBhEmiuh/MvjX+ZdaKKOtHw9oM7kO6r1zlGlXNR1ea9OS2481CWzU25/0AX1cJYtY5+IAfbBKRpLqfs9CYbwTZ6NBrCoN1pf2kZGYdQexGarB3bZhvrxxFVTJiAMHAgXb5vOFFYQyLcyKNVlIcywIsWwYa3bfBMRfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708518287; c=relaxed/simple;
	bh=Ly1OljPClTEhYVlaS04JNgtxOhq4z3DM0goo7tKAqGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H2Gszr8DwUNZME7wtffRJl4kFbvxdRRjANsRvqR2/KmI4RCRnFI7j0w7nWikBqXl3sqz//DqEYVJiQCWB2f6+HLH6sUJxElHp4wgfmeTtZxESyQrNv+Z6Uh1FS13RTIFoUzjhKEVyrFJJUb9Nr4qjJRr26CaBrAWTLq/Ktf4y6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=VC87f/FZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="VC87f/FZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54320C43399
	for <linux-coco@lists.linux.dev>; Wed, 21 Feb 2024 12:24:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="VC87f/FZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1708518282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ly1OljPClTEhYVlaS04JNgtxOhq4z3DM0goo7tKAqGE=;
	b=VC87f/FZflO/fZx5Tm/kI0awUgeBJGZhFf0uyodyCUqBZoevnyLJB1Q4FjlqiiGYsa0e+k
	X2/tEtd7r/vHhBbs6zRY+ZDVDaMuQ4oBlJYNqecIJpm75np2iJavp4Dg9Bs/r4sQoZNa5j
	EXVIXV2BP7u/vaIBrR5Mth1IRcaCUOM=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 415fc205 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-coco@lists.linux.dev>;
	Wed, 21 Feb 2024 12:24:42 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-607f8482b88so49487797b3.0
        for <linux-coco@lists.linux.dev>; Wed, 21 Feb 2024 04:24:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUW4bOy7suHs1G+FdVys6RolLSzDqCMUTkzbj2usuMfU9x6wu6S/A7wmWT5O9+4zKbjwLl9XmBJoI88IUeipRyhYBmjBLjK1fV1Lg==
X-Gm-Message-State: AOJu0YwFcHTBOxeWfby/z340JkNpdKjukIUAWdv27zSQ7qzbyM2TAkak
	IT6Zgheh+fcwI+UlkXH3YVulQ7bOjC0O+WSpHDuMkfeL1O/6fDnj8/7YrK4ERfWfokvph/vzUpQ
	lVAZnvJuzthSldfdS0SRb6JCwL+0=
X-Google-Smtp-Source: AGHT+IGcQVxItvjPz64aHU5TSkaBdXuleuO0dyyXrm9yPdRl8vXTB++OymHOd5YHCLzOZ2wWsiLhI4ACxCC/lZyyvKo=
X-Received: by 2002:a81:98d8:0:b0:604:9167:ccf2 with SMTP id
 p207-20020a8198d8000000b006049167ccf2mr15357940ywg.42.1708518280739; Wed, 21
 Feb 2024 04:24:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240214195744.8332-1-Jason@zx2c4.com> <20240214195744.8332-3-Jason@zx2c4.com>
 <DM8PR11MB57501389AE5518CB26E037D7E74D2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <Zc4QMAnrMiiCwkmX@zx2c4.com> <DM8PR11MB57503009DDA05C9F0CD683E7E74C2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <CAHmME9oj_LepJfMJHNxbTL+EBYHsnJUf2Q5WTwDotto4S5LrQg@mail.gmail.com> <DM8PR11MB5750FFAC83A7899DC2A5EBBAE7572@DM8PR11MB5750.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB5750FFAC83A7899DC2A5EBBAE7572@DM8PR11MB5750.namprd11.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 21 Feb 2024 13:24:29 +0100
X-Gmail-Original-Message-ID: <CAHmME9oSO0AYXf_FW-YXJxFmEkuSni-jRRnby+0acY9czn+YAQ@mail.gmail.com>
Message-ID: <CAHmME9oSO0AYXf_FW-YXJxFmEkuSni-jRRnby+0acY9czn+YAQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] x86/coco: Require seeding RNG with RDRAND on CoCo systems
To: "Reshetova, Elena" <elena.reshetova@intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, 
	=?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, 
	"Theodore Ts'o" <tytso@mit.edu>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 8:52=E2=80=AFAM Reshetova, Elena
<elena.reshetova@intel.com> wrote:
> Would you submit the patch or how do we proceed on this?

I need to send in a v3 anyway. So I'll do that, and then you can reply
with your `Reviewed-by: First Last <email>` line and then someone
handling tip@ will hopefully pull it in.

Jason
