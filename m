Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791751C1724
	for <linux-coco@lists.linux.dev>; Wed, 16 Oct 2024 10:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729076339; cv=none; b=FjlG04jtUqDjPwlzTWCcStcOxOPPTdukX6FKVx9DG2UMtyDpce5tMLYDAqKfFbL7fkEY+p0fGD4Juy4q0rOM5m+mrOCPnaDTcubAEu6NXfZqdoFY/HJ2Ib1NUGSBGX3TivVWg4c4b+zXtUK//JdkCFg6v3OtB/PN+KXg45ienDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729076339; c=relaxed/simple;
	bh=A5V6aEG08OAVBkRfDXL9NsCZdJWuEA5Tozd8ZfbAiaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kDyEPk3ksRiRNS+jq3QZ+GifX5igzyQ2fl5xkSnW7Da5Q/ZNHOBkSJCzr+QeHLPhZsOnLiviV2yKVPADPWiMDYmGOxDpZyb5qilR+yDPHntktv1PUHkvWWOQq4YHy5uz7iTCbuIA5IbYDfynzeVWqnM/To5ELTQ85tleFB5E5ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IIAgUAMh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IIAgUAMh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729076336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+prFWOtzPfzYxu14nAB4ULfwRc+W83wDfax9tJHNQOw=;
	b=IIAgUAMhcR72RH8oCA7uf3XRe73+Ihv/O5kt0JJ9OSfLljmdXCBIRU+SLvgsau7FJgzgzI
	2tvhM8M/rhMeLh2Mlx/oUTOHpSmoSKCaq3lQgAWfJAJc8UPpVQ2DJED8kzVugQA95Q5PYS
	btKym9a9PYaLC/eVZqi4Rhuki6kZ81Y=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-y17UpLGwOVuR_8fH27ae7g-1; Wed, 16 Oct 2024 06:58:55 -0400
X-MC-Unique: y17UpLGwOVuR_8fH27ae7g-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-20c70cc9d27so57737135ad.2
        for <linux-coco@lists.linux.dev>; Wed, 16 Oct 2024 03:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729076334; x=1729681134;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+prFWOtzPfzYxu14nAB4ULfwRc+W83wDfax9tJHNQOw=;
        b=p4fMQNoYl0/iOWlaUW5CObzlIENTdGjSF/7IlFORmZqvdGr/8B8q7/v+ur+/x4UWdV
         N4MZfwNz8E/NHCQ+RZTtD5rlb/oG5pIbe8nqh1dKVNhNsw6Xo9AaXiHTVOrv+NZh6Wrt
         7AsM5ZhBkjbJ0hBGgC5yJBQrtEctfQIi4FLw7m8A7zhCPaqMr6uY/lCFvxb4blz6VhjW
         ZQyLP65XIc0x3jWPHi/pXQ1XVU9WG6A3MHzaDW7cgmnREd6dorZJ1ItP/0AXr45u5vMS
         mnYjQVQ6WOTZwC12xG7eOT9QVz/JmmdgWNqRyPaMSb53cjia33b6vNuDPbTwYF2OS8hC
         HNjA==
X-Forwarded-Encrypted: i=1; AJvYcCXWj9BaEY+6I6ak0LrwmcQIaJNPPecj3WWLIYmvrH4sYevsIAELqadNM8wzfYBwPwUvqXaprT1jejaq@lists.linux.dev
X-Gm-Message-State: AOJu0YyJzYFTHnjuF9d4RrPPTr6b2eTlx/1aRzAIbPraA4fo36ETlep4
	enNdsgA/3it5mo6Cnn/1KyYEoIfXlk8YXY8cb4YK6KQmMXVpZHbN9dRmTNv9twQQrg0aALUoVND
	gYqoIRqQGe6c0eJvERSVdPngIXbE/+S4Bc5DfWNLjPcdhnxEm04SFQ4uB5rc=
X-Received: by 2002:a17:903:244b:b0:20c:eb89:4881 with SMTP id d9443c01a7336-20d27f1cbc0mr49812815ad.37.1729076332752;
        Wed, 16 Oct 2024 03:58:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN0Q90qqaZTjLPJzy4m2e1J4rfB6qzguYWzXNk+l+VQnEKQ3OlLdyODDHdnurpwXJHGrolfQ==
X-Received: by 2002:a17:903:244b:b0:20c:eb89:4881 with SMTP id d9443c01a7336-20d27f1cbc0mr49811785ad.37.1729076330948;
        Wed, 16 Oct 2024 03:58:50 -0700 (PDT)
Received: from [192.168.68.54] ([180.233.125.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1805b005sm26213155ad.240.2024.10.16.03.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 03:58:49 -0700 (PDT)
Message-ID: <7e4febb3-1fab-4c2d-8c85-b25fa3c94765@redhat.com>
Date: Wed, 16 Oct 2024 20:58:46 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Proposal: bi-weekly guest_memfd upstream call
To: David Hildenbrand <david@redhat.com>, linux-coco@lists.linux.dev,
 KVM <kvm@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <4b49248b-1cf1-44dc-9b50-ee551e1671ac@redhat.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <4b49248b-1cf1-44dc-9b50-ee551e1671ac@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi David,

On 10/10/24 11:39 PM, David Hildenbrand wrote:
> Ahoihoi,
> 
> while talking to a bunch of folks at LPC about guest_memfd, it was raised that there isn't really a place for people to discuss the development of guest_memfd on a regular basis.
> 
> There is a KVM upstream call, but guest_memfd is on its way of not being guest_memfd specific ("library") and there is the bi-weekly MM alignment call, but we're not going to hijack that meeting completely + a lot of guest_memfd stuff doesn't need all the MM experts ;)
> 
> So my proposal would be to have a bi-weekly meeting, to discuss ongoing development of guest_memfd, in particular:
> 
> (1) Organize development: (do we need 3 different implementation
>      of mmap() support ? ;) )
> (2) Discuss current progress and challenges
> (3) Cover future ideas and directions
> (4) Whatever else makes sense
> 
> Topic-wise it's relatively clear: guest_memfd extensions were one of the hot topics at LPC ;)
> 
> I would suggest every second Thursdays from 9:00 - 10:00am PDT (GMT-7), starting Thursday next week (2024-10-17).
> 
> We would be using Google Meet.
> 
> 
> Thoughts?
> 

Thanks for organizing it. I'm intrested and please include me if there
is a invite.

Thanks,
Gavin

