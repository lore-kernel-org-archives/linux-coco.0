Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AF825D8E7
	for <linux-coco@lists.linux.dev>; Mon, 24 Mar 2025 09:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742806832; cv=none; b=Ptkao5r2dvb8GKHgmJPy0FA8+Haupl0uPK8gJ6gVAoiCZe02Pd+PhkO0U66hZXGxxvkKPArteNYDEHOLBoUDe8KL5kB3PVl7kjNHkxo0GMj/q5Y/8xLkexVxQAMQ/h2SCpQ19sOWHBR0iQlS5T/ASLtONj6MCxb6oMWBbihSsMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742806832; c=relaxed/simple;
	bh=VtQd7ZzM47zcnMCUYhBnsvT1LXfPEQwzDz8Bh3c7XCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CjU/0EMJfWQEKaqvqX/r9Par8UkWiqi9ARILP3EPuIFZ2PD/hIEFI9qL/kxdx6j8nAvH/hsAiaPKZ3zfmfe6WyCFH/LbOJHVVAEvUop5zv7S+vLDRyigVer5ZL7UIOYAJhLCx6stgObdKLbPRA6D+oC9Ydneuy62qDKh/xd8rOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z1jZErQh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z1jZErQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742806829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VtQd7ZzM47zcnMCUYhBnsvT1LXfPEQwzDz8Bh3c7XCo=;
	b=Z1jZErQhumnhm90ODugoFMd1G0C5HzeKpvQc8NxeAaqjql5fXTxtJ4kS4EkzFN73Iqyy2k
	gsshRTagLXyTW4NejEdtYfJKyHB/qxvEmSZ8FsZlI+jSDtjohGcSTzUcfvGsCHXFprT+hI
	enp9k92qBpxeVvZXy7QMOL8vaRBnC+E=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-Cs-oUuH-P_qciRrWyB-AMg-1; Mon, 24 Mar 2025 05:00:26 -0400
X-MC-Unique: Cs-oUuH-P_qciRrWyB-AMg-1
X-Mimecast-MFC-AGG-ID: Cs-oUuH-P_qciRrWyB-AMg_1742806825
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-6f27dd44f86so55243927b3.0
        for <linux-coco@lists.linux.dev>; Mon, 24 Mar 2025 02:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742806825; x=1743411625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtQd7ZzM47zcnMCUYhBnsvT1LXfPEQwzDz8Bh3c7XCo=;
        b=RRYInBSPS74lLDrQKT/pX5fN8ErpmwITTCrhSJ7uUHha6v3sYQvLgiCmGsM839MAwZ
         4Qd4NLh4USjJUV0syH9vvm0Vu9PHz38ZavQ5BvecXZIeXU2rGoS8I27DK7ZLg+tsCYr0
         2TgHgrQnIzc7ViZaPIrPfKKbvJ3MZs6iohTe2dz3u7MnlRAQNLxCTehJCSQEsAVA6OCU
         xMUqItbbxegjU+92k+rGhvlyNG5+oDEa3RAd2XfyM/8CMPV5dCw4p/gKCq2YefpQEw1d
         pqEKPo2twstPkTXsbNB0UO6Qy4C6mNcPYdNqSdB1pLuMMSxMS35xWd6Bna70O5JoPGYL
         kMhg==
X-Forwarded-Encrypted: i=1; AJvYcCXak2VHqGwaXTzKiX268jT5B52Nzbnm7W94Cz6SsQrzQ6+PCFV9uBTc7MOSSQV35T4bwQ+dZeYgIB2J@lists.linux.dev
X-Gm-Message-State: AOJu0Yy74xLwrArNIoYM56f/RiUubLCBdiL7qlapR4n0UfeGLjTYGoMF
	AlEo8cvZQLKWrkRrvG/6Xb1/ah53UJMaqC3AvyBNCkMywWc0jwf9oJUTyrt3d2mf+FR6j5fpvxS
	7IkLLzbsygii8ae+S9VfdLddcw6eMDN9WeQyaTpaHTkmem/huENd4KSaNFZ9Zl744xDmtNRnx3o
	Z6YKREy6EppNPHLJGS9texJrCxfax5u0SOQA==
X-Gm-Gg: ASbGncu7LXMXt1jV2KKrnKAmBtTVV/y7PLFyIFBSQLO13LcRPgEcuofXjS1lUD/xOEV
	6t9GTDF7C6oYoux0H1fZoMV+HPIkdjryZodpmai2nV5pf3uA/XCCcjF6zccXwpe2qwGnDBQ==
X-Received: by 2002:a05:690c:3588:b0:6fe:b109:6973 with SMTP id 00721157ae682-700bacfba94mr158095957b3.24.1742806825341;
        Mon, 24 Mar 2025 02:00:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrUHGJpHADoIDbX/Sou896YczE/U5d5SAf7THitdTqPnQR8uE2GhDufDdh/tsFnucbOoNKGD29uDDAHCwOw5c=
X-Received: by 2002:a05:690c:3588:b0:6fe:b109:6973 with SMTP id
 00721157ae682-700bacfba94mr158095497b3.24.1742806824797; Mon, 24 Mar 2025
 02:00:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250311094225.35129-1-sgarzare@redhat.com> <20250311094225.35129-2-sgarzare@redhat.com>
 <d7e5a1d2-5fcc-bf7f-a67d-7871a1627c98@amd.com> <Z9glWp6U6vyEmKQa@kernel.org>
 <7kuhiyy7gj4py323g5n2vy3ddlg666zwhtx3mjcklebgtlstdc@xgdyeecifwei>
 <Z9wuLVeP726Cssqp@kernel.org> <20250320171619.GOZ9xNY4W54avW2a-u@fat_crate.local>
 <Z9xQw8QpRKk26G6R@kernel.org> <rspkz663fg7i7jomvg5ehv3ldr6ayehttb7vgwwzsfsxafzb5y@uhqcadvsmw6f>
 <20250321220520.GFZ93ioO0JtfhXCb1n@fat_crate.local> <Z98av2cbURhSy6Rk@kernel.org>
In-Reply-To: <Z98av2cbURhSy6Rk@kernel.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 24 Mar 2025 10:00:13 +0100
X-Gm-Features: AQ5f1Jq8rkzGdhbXeWVtUWD697l_-G9Y-_hvBqVxJBnsvHw0N0RMVXOA163V3KQ
Message-ID: <CAGxU2F68_3nAzgPNj0m1SX-RPumuM2utX6B0-s4GDvFixJmt7g@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] x86/sev: add SVSM vTPM probe/send_command functions
To: Jarkko Sakkinen <jarkko@kernel.org>, Borislav Petkov <bp@alien8.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Peter Huewe <peterhuewe@gmx.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	linux-integrity@vger.kernel.org, Dov Murik <dovmurik@linux.ibm.com>, 
	Dionna Glaze <dionnaglaze@google.com>, linux-coco@lists.linux.dev, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Joerg Roedel <jroedel@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: olTUYJVDkDBbbtq2M9s79k-jsqeV9boDW6k7Y_8IEz8_1742806825
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 22, 2025 at 10:17:03PM +0200, Jarkko Sakkinen wrote:
>On Fri, Mar 21, 2025 at 11:05:20PM +0100, Borislav Petkov wrote:
>> On Fri, Mar 21, 2025 at 10:01:17AM +0100, Stefano Garzarella wrote:
>> > Just a note, patch 2 adds `include/linux/svsm_vtpm.h`, that file is
>> > basically a translation of the AMD SVSM specification into structures and
>> > functions used to communicate with SVSM in the way it is defined by the
>> > specification.
>> >
>> > I realized that the file does not fall under any section of MAINTAINERS.
>> > How do you suggest we proceed?
>> >
>> > Should we create an SVSM section to maintain it, including the TPM driver
>> > and future other drivers,etc.?
>>
>> This all belongs to the TPM drivers, right?

For now yes, we may have other devices in the future, but we can think
about that later.

>>
>> I.e., drivers/char/tpm/
>>
>> So I guess add that header to the TPM DEVICE DRIVER section if the gents there
>> are fine with it...
>
>It's fine for me but I'd suggest to rename the header as "tpm_svsm.h".
>Then this will already provide coverage:
>
>https://web.git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/commit/?id=a2fbcecc7027944a2ce447d4dd72725c5822321f
>

Great, I'll rename it and send v4.

Thanks,
Stefano

