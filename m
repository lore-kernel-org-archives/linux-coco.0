Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709F32EF2A9
	for <linux-coco@lists.linux.dev>; Wed, 23 Jul 2025 15:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753283126; cv=none; b=qEQVd0AtvBHiTExmKtTXEUEGW4tUoHY4fsrvJNH2AdbpNBGOq4hiH0NgfDZAnS9aiy4VrGzi/WVmr5jZoGBpiQ3d6/maaUs0IGO7tTpgg8UdWv56eaDubzpqhxuO832PgGZfem5aYP371z6bN9F1pYQK1k3RFtZsAVihB8gNaSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753283126; c=relaxed/simple;
	bh=yv5nB3643mwqFffYhxn7JpZMpQCIFo0F3qmPkPIlgM0=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=joLGcyXQwomZa0HuKx1NFUmxIDFRR2OZRIIKHiRbkZorFEphP/KkhQlVCtzQjKQeW0Bb4XNtQoO0b9xlP+kDl75HysH6SYLtOkdRsxpR7/LWMdODcvFJ2Kn2g7N9usrBxNp+WhBsCQOgmh2GjMfU678nm0ylPAHUvQWNUYbdyPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f+rOthXq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f+rOthXq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753283123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=yv5nB3643mwqFffYhxn7JpZMpQCIFo0F3qmPkPIlgM0=;
	b=f+rOthXq91A7PkLb1LJoQXCsf7uznn253tN3ge2IieIxy3FGVbeyx7ajZyN7fRx9wTe71T
	ZFqqPZnD+mI/bosiyX2spIC/6bB2i41msOd9PqpGsH1Is1XtTz/Mzebrb0dxRf1AttqhRH
	T9MjLkYbbX2PdbPkdSwr/yR4OLmTrr8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-qA4-Q_OVOJ-TH5Xbc8fC-A-1; Wed, 23 Jul 2025 11:05:21 -0400
X-MC-Unique: qA4-Q_OVOJ-TH5Xbc8fC-A-1
X-Mimecast-MFC-AGG-ID: qA4-Q_OVOJ-TH5Xbc8fC-A_1753283121
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45526e19f43so28358685e9.3
        for <linux-coco@lists.linux.dev>; Wed, 23 Jul 2025 08:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753283120; x=1753887920;
        h=content-transfer-encoding:organization:autocrypt:subject:to:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yv5nB3643mwqFffYhxn7JpZMpQCIFo0F3qmPkPIlgM0=;
        b=NKtqJx1FadawDnObxTArfLIXpV0bpMTsQKUR7apHV2/AuPE7ccjhDmUdX8pOdBmDZy
         oO3CpG4ozkRs4RZFGKlpOqavp+a8PZ7M2SdVzYiZH2X53w9ItYErmNo0t/TY1XQeIVYz
         RW1KJ/R8V8QFGnfx5w784fZ558YhwbM3yX+VVfTVE/OwDrSeEi10/Qwimp4BTDQHJFQy
         tTs7clbCN/uFkkwFwD0rMjH3LCBF47Rj9IoggQjJl7eaNWb29LTul9LK7yb/wdg95N0+
         0sy7a2lqE2zipZDhY79a7U7Iz3H6f9fIWjW4OevJ1y6JKvNwRjWgisR9VEb5laEIIlFw
         Ai2Q==
X-Gm-Message-State: AOJu0YxwACho6VYvTCJJl/Boer4hHPvdOr6DbtySOc+ku3rpx9Fpndc8
	i3qgN4EomlH0pomO+36KBWmL4TeHqYonjKH7EGBwxy75riRDC/6qMt1PfdXUZWS48B9C8XITst9
	DTP5vsdIpwYAw2yR79nL01Kg8BuSVcI+7nqQ6Z6aHkS/WK4+L+GolXjBxjjqCM/oEIh54YzEkIc
	RV/H7L14eUxiDcSD9nOKWor3iFR22IbU8oRANN24Mows8bPKAd
X-Gm-Gg: ASbGncs9p3vv463o4hvENbXYdCZ68CMENu3BdRz9gCODo6A3e7m6Exd/F0dwTOeGNSY
	SbVb8kdNLFMxKjez4CiXr0tcNiUmSJ/mLDOk3YD+NcWqYwepJEso9mmU+usqw82iwIOvPMYQ1Ak
	ySdX47pHn88P03PuH2g2QOX9B93cGQOUiSfki5I04cAsbWbapbTX75S0tZC7hMGPMJCl9CbNaDC
	jU6vqVyBn5nWDdhB7Q0MmzE1sgjwioIiyiuiWKGu0BVIi60m78pG0MnWt6gYSfFsk4qXj6vLZTS
	3jDU3YzKF9amqSnhXxqUcYLJ6jGhnQWEucVXRRN8OOQ5hk6gdmAnTCDnNTnNt/+j4aYDelkUu3N
	I/shoO/axGWpdHVKKjY7yOLJlbbrsBNfbGRbYxnvLBD+WBCwyMK8jmoDa93MP0ypE1Yk=
X-Received: by 2002:a05:600c:6992:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-45868c99c85mr30116455e9.12.1753283119514;
        Wed, 23 Jul 2025 08:05:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2F5mSqLZEunEzF7urtX2WBp8ykNV6oKnn0wFMx2cm8cOAKr3D8at2B+ii/3mueYJl1zKZiQ==
X-Received: by 2002:a05:600c:6992:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-45868c99c85mr30113555e9.12.1753283117177;
        Wed, 23 Jul 2025 08:05:17 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f00:4000:a438:1541:1da1:723a? (p200300d82f004000a43815411da1723a.dip0.t-ipconnect.de. [2003:d8:2f00:4000:a438:1541:1da1:723a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca2cc06sm16564115f8f.35.2025.07.23.08.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 08:05:16 -0700 (PDT)
Message-ID: <37a930a0-e1ba-4be7-8b0a-4fb5409131d4@redhat.com>
Date: Wed, 23 Jul 2025 17:05:15 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: David Hildenbrand <david@redhat.com>
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, KVM <kvm@vger.kernel.org>
Subject: [Invitation] bi-weekly guest_memfd upstream call on 2025-07-24
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lxeTiQ-6EKFZc0ZLpy1vaVtr5Dy-ugc2PgiWXQDuZ3Q_1753283121
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi everybody,

whoops, I almost forgot.

Our next guest_memfd upstream call is scheduled for tomorrow,
Thursday, 2025-07-24 at 8:00 - 9:00am (GMT-07:00) Pacific Time - Vancouver.

We'll be using the following Google meet:
http://meet.google.com/wxp-wtju-jzw

The meeting notes can be found at [1], where we also link recordings and
collect current guest_memfd upstream proposals. If you want an google
calendar invitation that also covers all future meetings, just write me
a mail.

To put something to discuss onto the agenda, reply to this mail or add
them to the "Topics/questions for next meeting(s)" section in the
meeting notes as a comment.

Cheers,

David

[1]
https://docs.google.com/document/d/1M6766BzdY1Lhk7LiR5IqVR8B8mG3cr-cxTxOrAosPOk/edit?usp=sharing

