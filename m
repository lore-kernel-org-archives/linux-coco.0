Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793231614;
	b=kImwWPK6w3X13q6l6fHT4qWa+LR1HDPwSqfLoocF9cwJzGNy4HWwDrpNFMf87jyX6h9F
	 tpdCWrgBW5meIKHwqE38mG3SFyBoKWlNBBPSRjIAsSv5K6HzwjzWQYmKnVd8wSPal9pHe
	 ryIVtxuBiuRC3ys3wch/FvDSx2BdDG81iINs6Q7tMVqsoWQcbOivhXqzqJRMRfnZap1mK
	 mc/r9uDPJRJb+Ebxfk2DkCXkpKC9WtnUmj4V8ggSQgfxnpeSleNnxwi0mnIix7cQNeKK5
	 +O1JOgyuVhGZC0XWdiPpyxKw/x0Rz8uuEGYETDEAKraPOZ9cQbfUKeCj4WQuNv760Eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793231614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:MIME-Version:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=Xf3WpLpXOd9QYLR4dzKoF2rSwhCdMC+MRZJA9cEo7i0=;
	b=wzq/G0Eb+zfyOFRxsNpD3WhksPDIM0infLX7THg9xBdRWjI/5aivqV3IdjdVfqpvkoZv
	 MhTeuax/hl9azPpeCbiBhSmEH665hjwY9Q482z0OveSrfxn1Bwsde7klz/Smsmtezw8ZK
	 CIjmygeIQUuZjam+hk0DbMwI7F6UNIGXwrkULD3jHmsmKKuz5X9ywIY0XE5irE/reKH1X
	 h6nZ1kCecffzCbywJoZoJyWXPoR+VF3u9md6IfwJjYrVMt771JQcXWjrnnOvA0dpV32Kc
	 8IWxBYqSoebasEMqiZzGq4KFrd6xqqWz3vhUGmEuKkU43bmXHhuSJsP6Rq1Kh/PWdpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oeLOe87c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBF5606A31C
	for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 23:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DBF5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oeLOe87c
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53669f7b518so19363331cf.2
        for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 16:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793231613; cv=none;
        d=google.com; s=arc-20260327;
        b=cAOHzi8T0lFHwJfhbYPcm9JrtZ40vhYTrZ8bHPG0dVtouHXdumSc/t++72abVjnj/p
         zhfkEYwwOXY8KeKidM3Hw6HMQZxO6Adzv2/ggTxuGuLQymMcLU0zSslvItHhGhS+TIsY
         3zn85MYm6YdaKvqkxlUjvQuNSVXms6XdkMe6H5DdSfBaPU6GWNSwhOe1+F6B6/hew6tB
         DoSo0HOVFP5/zWFDLbDoIt26NHVIViA6SPY377T5krrrKqvPCrQ1HeSESHRPahTlgmld
         D5ZGAgvfPj3TLGOcmBLNglJV3Dw4bs36JbayJvnhD2MbWLj1KK3eYMKl39YNse7IbLHE
         9lZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=Xf3WpLpXOd9QYLR4dzKoF2rSwhCdMC+MRZJA9cEo7i0=;
        fh=Gl4NfJmnFHBxqpjcFRGUKAPNlLucdtvGNNqV0bv7lHI=;
        b=YGk+mJmbeyEDtP9xyh58XfzaYhaakimyNQMd1muSizBCFuVdLBYZ1SD/lbDlVQHsvh
         C9bEPyFfgIooQic7qFYbc5/j42lkDgkVxpcU5fp2SxuHzzdJYtOOaTSsB1mV+RX6/pJM
         hvT4e+9dXP8l3/o0mQb6GUfHb8DK+/p6H8Mbwp4UCYwriF6UNS8FvWCNi32/MW4BCZ6Q
         yB98ZNAgqzRJNtPld73LUZ7mSWK0ErfYUFvrvaa0/+pk6A4q/ycwIQMkHmBnOGhxoE5B
         nd5r7A8WxrptLxZ9Bhoj1aCc4QQ3M5rcLQuhDBEw3Rpe4IaerWETt2kgDnfWjpGQyB5O
         5zPA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793231613; x=1793836413; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:mime-version:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Xf3WpLpXOd9QYLR4dzKoF2rSwhCdMC+MRZJA9cEo7i0=;
        b=oeLOe87c46ahPA6ASxXy+2DV4bK49hVfvou/FY/0+wkttvM0bLaFeHKSZPxlRIcnnL
         WWo/hrorErNR6n28vK6di5klpupb10+huZAojH5shjC6JzdWZ2feZ0MUoeWewcDPqjvX
         fIHoAMqtKOtHcNZEwF3c7mNjEYcqGIbxCtZ0QUJModdhjh8aBXArF9GlOzWV2sRjrlS2
         JPpsxDsvu2djCcIzYNmPJaQaFSs9+n4RbS/W9kTMmaiajI9jjEaRClp28NHZNFCwYu7u
         zzS4m2N9GZGqyiXvxeDatr5OW1E2z5X82NPne776EpvKn/GWNvQ2huFntIb1xu16Y+Q9
         XJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793231613; x=1793836413;
        h=content-type:to:subject:message-id:date:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xf3WpLpXOd9QYLR4dzKoF2rSwhCdMC+MRZJA9cEo7i0=;
        b=CQIFKKL/ry1MaiShQKIf81OKarhNk9YhRbgBeOAyjBlWbJqlXbbpzMmduCUFGqa+71
         Ul0HARiWxiCJW+emoxTk00lTpQoDHYNek5fpvC8G4CjNyAtvlBadC8Y5UwwOzgp0t1Bh
         I8/CcSkRPsGuiJ+QNCeJP1jyFmMX+5fqiZmVDoPnHCVjPMdad1WjArAdD3R1HVFfw/Ap
         HoNOM5JtBi/n0HTOcvIKqrIQjAP6VyAuvaA8lIOh/s3fAA5gjy6nNVz5Y8w0Y9dph0Pk
         2cEsvC+K6MTm7Wo+9HXpQfU545gh73fhv/XLP/sIl3oulqHmDS69DvKd+DmUar+0yFWC
         6p5Q==
X-Gm-Message-State: AFq9FYJRFvgbE5FxJAbV73DrL6M5g1XfuTUXb3cv5kHacmkVR1fy60Lg
	Kst5hwEZbbdf88hwcjKzZW9Fa2s8zRlio+iFYqG8QeZgRmg8EGrsTbjs8XdV/IB1KN1Gkavocgo
	yUVKf7OqIexVmF8EzyijvRiofqe4kUbdf64LxWa0RJ1NCiA1rWdyvx01PfYQ=
X-Gm-Gg: AYBFou1lB36+Szrs6Wcob/oaj/NBahU3JmzsIXWquapNDhARgmi/jaFQfcFZWuCxctm
	qOyB+NUWFWnvsRK99h9BCZWWIVnaGn8/U236F9XjIrfBvYD3+OxcjHlL43ABpQ0HFUjm5GT7oZo
	hipA05swsBA1aC+zP0hVJUq6Z0qQv4ITKUKom8z3lbuhQaqSuaD3DixGakTaU82YDTVzeBgL43/
	E0kB87SGWVFWMCpb+Rprl+eVT9JZH6O+baIwH3SWobBALkT2IwyMpDk5qNR6Nx996NtrIx9FAmS
	0B3vgj/up7KbF8UJKIfvvrcZCJgqALizWujsANvm465/Y7Mka5/SF+E8qBc3fLeJQQLMhW6oKwD
	UXGpY6v7SgkJmglt6aJ2ThkBuYPOsByPvXyACcsN3a9iInCby7POPXQ9xK9m8myLXdZ5OImkdM9
	GcF6ZwvH47PmWVmZTGE1Be9rg=
X-Received: by 2002:ac8:5dd3:0:b0:536:6856:f590 with SMTP id
 d75a77b69052e-53fcb5099a7mr71999251cf.18.1793231612338; Wed, 28 Oct 2026
 16:53:32 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 16:53:31 -0700
From: Ackerley Tng <ackerleytng@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Wed, 28 Oct 2026 16:53:31 -0700
X-Gm-Features: AclHuK8fEnLx-zmlQH6Ok-lGIPb5dW6dcApY-4tFErjZ48FFcbY1Het0S7rgZRo
Message-ID: <CAEvNRgFaNnCHKe+rbGkw-BwCMoHzqw1ekUiMcT=zCh1TknzMvw@mail.gmail.com>
Subject: [Invitation] bi-weekly guest_memfd upstream call on 2026-10-29
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	KVM <kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

Our next guest_memfd upstream call is scheduled for tomorrow, Thursday,
2026-10-29 8:00 - 9:00am (GMT-07:00) Pacific Time - Vancouver.

We have a couple of things to discuss on our agenda:

 - Alternative memory providers for guest_memfd
 - Quick update on conversions

We'll be using the following Google meet:
http://meet.google.com/wxp-wtju-jzw

The meeting notes can be found at [1], where we also link recordings and
collect current guest_memfd upstream proposals. If you want an google
calendar invitation that also covers all future meetings, just write me
or David a mail.

To put something to discuss onto the agenda, reply to this mail or add
them to the "Topics/questions for next meeting(s)" section in the
meeting notes as a comment.

[1] https://docs.google.com/document/d/1M6766BzdY1Lhk7LiR5IqVR8B8mG3cr-cxTxOrAosPOk/edit?usp=sharing

Thanks,

Ackerley
