Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CED7241CBA
	for <linux-coco@lists.linux.dev>; Wed,  9 Jul 2025 21:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752097342; cv=none; b=n75qMR07URclA7QFNa7nQrS17LDCEGCUZIfA4CmntL6JDKPXglwVHxAJtcdIkQYEaieX3Xi1aIF+iDmny/IxC/l1KvmoF04AUHjb9ND8H7V4Oon4mr0d6fS74en5ERA+2fla4XJxnkalE5yM8zPutBscr2N0jQDvIJIiVNyupdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752097342; c=relaxed/simple;
	bh=ONyJIALQYodap1f+oru3ctWHF6uirm4HBwn23NGzxyo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=a6UhkbZ10LsAN83nrWix6Eosk9FxCjVqDHl5NRFHIp3BGvcegK32wJG26xsGbkSDG5toglUK6wakiqKPax9sVjju+npn/ZxkdGtZ04f20qIKJ04FkRi3/KPjrvWaX5enMnvJmWr3HhQ+OSHPrgDv+h09daHcPhQSsqfE9rblY/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NqznyiS8; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NqznyiS8"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-531b4407cfbso140829e0c.1
        for <linux-coco@lists.linux.dev>; Wed, 09 Jul 2025 14:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752097339; x=1752702139; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ONyJIALQYodap1f+oru3ctWHF6uirm4HBwn23NGzxyo=;
        b=NqznyiS8ILFtcSyp3kGapVqLhmhQt6DD5VuCM2xm9jkVwZluR35FXS58Br4+z2v3Ik
         NbVTQvQQdQQ+rkrPrgwiuFmSPkgDe60Rvz/3LtBdxwzLeukYKxDvblsCOXvwK1Q550BV
         cqWWgOFKfErbEz6R13DKDQ6/b2gyIpguK9OGoVEVO8X6wJfqazEm1iw160B6KNrxq0NF
         +yUJqW9iBYlWy4brqo5IKbZFNhr6J+ngOKdm3uw08zppHcgoOZ0rZp5gDx0LsXs2lakK
         dENztMgw/pdgnT8ouNXmTSPChzkmoPFxSVI3onE5ck5TfJyir8HX85FztXCGJVshYP6A
         nR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752097339; x=1752702139;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ONyJIALQYodap1f+oru3ctWHF6uirm4HBwn23NGzxyo=;
        b=UeUa4rFMoX4olYVJFqf30s0lZ9+rHJ7lkKVyCzNqgSFdgAaOBjfZMOUTmOF6fW9bMb
         gF1l3AcqhW6GJWru8+YGoqoAdNq2cqpAwwc6y8tP3ECR3+iAotyWsDeDwwbhp55xY4jK
         cGHrjNQdNTjwzQf2Xd8Yb8oCV0UEVAd0NlEVcdvvTBtYGA5/oykOWvuKcO9kR49Glz7d
         7Tl6LONXIrKazsrJIDYRw1tkv+w6m3hcLIZ+QVVFcGUg2fXUYguAIpXNsAqQ5fTkXkHa
         fN5AVeyCdO5l+Z5bD7ncjKo0Rfhbk31R8vpmTn3tWkn/YNttbwFXllkrhsDd/ifjNQPk
         vhRw==
X-Gm-Message-State: AOJu0YwICZBbnUL8nF69scVyvVTSHcT+Xkhh7izGlZVcqcw9JHNh8v6b
	yVlStj4wXrcUOzScUFzOcRJMrK9DGQBgiKC0LhnJwV9UwAgaLWv8PxWbZG3qutMC5Fp/XuxkpcX
	U7aanp69YlTmDvWOcol0T1Vy4Dbn2rR3MJY4C75rZBYEYxw4ZSRbohkt1JKk=
X-Gm-Gg: ASbGncuEv97wTMurZbPr8yFoPgFsal6oLhgLz+aIZWvzTHhMQ1saGP0ohP42Y4oR6xD
	2suhY4XBkKISJc0s9EQdibfLCCMq2kRQNq1/LGjRNACnzYdV8I93h0ymk5WZG9Z5wHsZ99+cCz8
	VlxtXrz3ceA+qXliFqEB2SCxR3vvL101T7UM71U7UeY50=
X-Google-Smtp-Source: AGHT+IH2SFXFn0FnHoEQj6WtS/wwLTVjeEE/BUFYeE0jSoTYfeCVc/HqIzr/1Z335QlTmWB1Ag2GfTpAr18y2M5/cDY=
X-Received: by 2002:a05:6122:c86:b0:530:7a17:88cc with SMTP id
 71dfb90a1353d-535e6cceaf3mr65749e0c.8.1752097338933; Wed, 09 Jul 2025
 14:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Steve Rutherford <srutherford@google.com>
Date: Wed, 9 Jul 2025 14:41:42 -0700
X-Gm-Features: Ac12FXyKDbXeuxbb2NNPxJkEAZfwDZ_7OFSqmpDwfGuUWfzGqxWXrczuVTZbb_Y
Message-ID: <CABayD+egKbxXBz07AsLqrxZXsZMyrtJbRxpqP005uPmE03uS9g@mail.gmail.com>
Subject: CCC Kernel SIG Meeting - Thursday, July 10th at 9AM PDT
To: linux-coco@lists.linux.dev
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>, Ani Sinha <anisinha@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Dan Middleton <dan.middleton@linux.intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Joerg Roedel <jroedel@suse.de>, Jon Lange <jlange@microsoft.com>, 
	"cho@microsoft.com" <cho@microsoft.com>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

We have an instance of the CCC Kernel SIG coming up Thursday, July 10th at 9AM
PDT (6PM CEST).

I believe there is to continue the discussion of Bring Your Own
Firmware (F-UKI/IGVM/etc). If there are other topics, feel free to
post here, and I'll explicitly add them to the agenda.

Thanks,
Steve

Agenda - https://docs.google.com/document/d/18D820gyt2xe84Jy6dGXgrNThApoozcekDzvIlK2_bd4/edit?tab=t.0
Zoom link - https://zoom-lfx.platform.linuxfoundation.org/meeting/92401169243?password=e6c02995-6cfb-4f90-82b6-747f767eb168
Calendar - https://confidentialcomputing.io/get-involved/calendar/
