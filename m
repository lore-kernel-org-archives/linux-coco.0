Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8A353E3E
	for <linux-coco@lists.linux.dev>; Mon, 20 May 2024 13:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716212944; cv=none; b=DM/WyvMxrY12qFMMZWq4cjEJHB+GVZdkreIRnC3VBThDlw68SE/Ehnc+PEI/HzTuAgLU1yhlZv5ZMvZaQ/g+/QfEEv++MYsj34IrEHLZxx3/wYZY+e/1g5wqZoNy/4O/PdDVHOgFwHzQw+KviSgwS0krbBmfmkLQwnCbDbjrM3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716212944; c=relaxed/simple;
	bh=6gAQwjlt1Lf6/xnYJFSYyzHnBMyQlxfbiPdG5vR45kM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rhiXcH3dRdjnECSKfJLow5DWA6IhwdlSRxcMv2VlF7axIGk2NBhZIx5WnkhsjitcKvMGcox0+dj1y8to3ytZhLhdHQxNv6T3vzujZzkctLNlWJF2FxZoSNnbHXiX/reVmCIaUf4s3ToucwhHhOC6iVftPABAazwmBS/xj37Qiyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuAL2yWN; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuAL2yWN"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6f0ede03023so978168a34.0
        for <linux-coco@lists.linux.dev>; Mon, 20 May 2024 06:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716212942; x=1716817742; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6gAQwjlt1Lf6/xnYJFSYyzHnBMyQlxfbiPdG5vR45kM=;
        b=MuAL2yWN0RCWLi5Qmcp+CmT/R/SMhJzPb9gOIkOW1vXzPUj0psO1BpunCixjtN0poC
         C5uuae52Ijsll4XpFe74RC6SICBiF2FhRihvW5L9h4/K3Kjw7Akj24cdKq3w5eufCzli
         gb33ddsBSCF5YzrO8wao171ZN+i0xv7dNJTzWYtft3FR5pm8Y9lZOZdolVy1Zq3iSHDP
         5UFj73PXSbCPw1NCuHhz+1YgJr0yqphPtPO5gII9WwPSPH5AR6aO1jw0WKBH16V3A0Bz
         R9wwdDK8qrcuktv/3hzyVgYusn01g9cT/pkvPCcs+Uf0T1du5w4/3Y4u/AeuwdsnG3MS
         zZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212942; x=1716817742;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6gAQwjlt1Lf6/xnYJFSYyzHnBMyQlxfbiPdG5vR45kM=;
        b=af1jIKWeAS533IMhZPwuUh3JG0lv4hZ8VL38DHSdgjPI1oJ0yXsOszMYUKFY/OJHyR
         oWGvBhOAG/4Pt6f/z/3oIjeaVqAK8H4dtfnHT3U0hX1Qsr2IJI6Ka56f6Pnomb6YOXxL
         SGPSD6PDazbEmZ71dQ6nP38zaA80Vd9KMr8u9I89LawabEjEge9p7r4wCU8w7uzIDNCj
         P7NbKrJYkEhDIpPFX7NBn6+m9dUQqpoinsJilNMMIr8HS3kvVqzsgV7itIZ1wFx1r1Mm
         nzhYWQxooZ9DqZld/izOyks5v5wzDrwHSE+ZvY58esnheOl47RS2Pz7uhAlPZVH+gjz/
         b7tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcEhASVGZTFLDHCMCdPcaOT3UBzSk/lB9y/2cHOxqTmsOHFHZQrzrFcQVkO7aQaxJvxkogOO/egHcyOFtwNJmFny5rzC8h9lQjxw==
X-Gm-Message-State: AOJu0Yw8qige2TVlDNYeP8TKxbf0IiKEQmrQ+Lor/c+KSWOW5cI6ZoeG
	pC0z/r+79g9947nR7bQ7MEGkGnuV3rfMZwDYYy1ko418HtfnjnIO
X-Google-Smtp-Source: AGHT+IGKZLu/Z9N+xI6zYc7/lPYsbvLG0rFYVkPMmquhfoFbH4AYb6GNldD6sgF8oVfnen71ZoObwA==
X-Received: by 2002:a9d:63d0:0:b0:6f0:e54b:d968 with SMTP id 46e09a7af769-6f13d83ba47mr2554300a34.16.1716212942395;
        Mon, 20 May 2024 06:49:02 -0700 (PDT)
Received: from ?IPV6:2603:8080:2300:de:a9f0:3fbf:c113:e332? ([2603:8080:2300:de:a9f0:3fbf:c113:e332])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f10bdfab8csm2872239a34.28.2024.05.20.06.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 06:49:01 -0700 (PDT)
Message-ID: <cfdf1ee1-41a3-46f1-9a71-ad09894ee931@gmail.com>
Date: Mon, 20 May 2024 08:49:00 -0500
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: SEV: Fix unused variable in guest request handling
To: Markus Elfring <Markus.Elfring@web.de>,
 Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-coco@lists.linux.dev
Cc: LKML <linux-kernel@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>
References: <20240513181928.720979-1-michael.roth@amd.com>
 <76413d53-4572-4a38-baff-8b01f6179c8e@web.de>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <76413d53-4572-4a38-baff-8b01f6179c8e@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hey Markus,

On 5/19/24 12:50 AM, Markus Elfring wrote:
>> The variable 'sev' is assigned, but never used. Remove it.
> Would it be a bit nicer to use the word “Omit” instead of “Fix”
> in the summary phrase?


I can find many instances of "Fix unused variable" in the history of the
kernel:

ubsan: fix unused variable warning in test module
x86/resctrl: Fix unused variable warning in cache_alloc_hsw_probe()
octeontx2-pf: Fix unused variable build error
etc...

but not a single "Omit unused variable" commit.


>
> Regards,
> Markus


Thanks,
Carlos

