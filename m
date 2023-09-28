Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4968D13AFB
	for <linux-coco@lists.linux.dev>; Thu, 28 Sep 2023 17:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695921279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IoOMdWsqx13KyfLDmhd8kwn+FZuK3U7Zd1iwFOjjXP0=;
	b=IqJxie0C2PYnojl6KJqT/K1pUvAykASHFbzvV17yMBYfbc8ZAVvT43wTSaqpgyFOV7G7hL
	AvhfTfGZN/D0nYZ7ApiF5LERMhHniObphVC/6XDeAzwNV4XQ6oABbRC6yKOEXUk4NSts2w
	YZ2GrBh10eihKdn/Mb2KbK4rF/QsJ30=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-H8_bf3WxOVmfkFTD5hxKww-1; Thu, 28 Sep 2023 13:14:37 -0400
X-MC-Unique: H8_bf3WxOVmfkFTD5hxKww-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-32480c0ad52so1443708f8f.0
        for <linux-coco@lists.linux.dev>; Thu, 28 Sep 2023 10:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695921277; x=1696526077;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IoOMdWsqx13KyfLDmhd8kwn+FZuK3U7Zd1iwFOjjXP0=;
        b=konRlGMWOkD2/ZfAG0rYmL0HsgdNhiMUg00wtI+7RkWfeJZDSeMGjCFmxt18dq8SLw
         LOB44MP4eScgb4TxtXA6LfboNmK9rWLXRQUw8ovoq5I7aVztM0/wLxtLB2DBWNn36I5W
         J0U4epNkE2++kUwms6CIijThz5+EL58+yeZ2mB0a/x+pmujao9Jt83eFBRnQltgZJydX
         wsua7h2vkQVH+GFOu7SwOUUC0h1W0c9eEd7rnawRi/wokA11SI1INfBSQ62v5aRnSNLc
         xI0k+wEC51jY4AlmgLbIwuiTEi+Nt1zpUEf//j6I97icgNmgJ5GEybhMmQ6lc9wCJP7P
         dVRw==
X-Gm-Message-State: AOJu0YzCHuDhJUTnJelyYvtzmw0BpM/rlg1Xa4pYH+V0/GWcFWOsVLwp
	xtOxnpGneJWp9I/hyhBBqWf0S8ezlE/uRPybYM3RVYjVSfKB31ouFIiOAg37FgAx5WxI9aXTvY8
	QfW3x2H+zM1yGlMoW7c1nGQ==
X-Received: by 2002:a5d:4d45:0:b0:31f:fcee:afcf with SMTP id a5-20020a5d4d45000000b0031ffceeafcfmr1675084wru.71.1695921276834;
        Thu, 28 Sep 2023 10:14:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaHAI0Jl7BgDloLvOXP39Cbg4Q6f6RcYSSUyl32ffjmWzsxBgubexMfj/vYKlBpyoT2n5HAQ==
X-Received: by 2002:a5d:4d45:0:b0:31f:fcee:afcf with SMTP id a5-20020a5d4d45000000b0031ffceeafcfmr1675065wru.71.1695921276488;
        Thu, 28 Sep 2023 10:14:36 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id e21-20020a056402149500b005256d80cdaesm9954826edv.65.2023.09.28.10.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 10:14:35 -0700 (PDT)
Message-ID: <fd764cff-f4bc-a13d-96dc-a7eaab8434f2@redhat.com>
Date: Thu, 28 Sep 2023 19:14:29 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Sean Christopherson <seanjc@google.com>,
 Isaku Yamahata <isaku.yamahata@linux.intel.com>
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, isaku.yamahata@gmail.com,
 Michael Roth <michael.roth@amd.com>, erdemaktas@google.com,
 Sagi Shahar <sagis@google.com>, David Matlack <dmatlack@google.com>,
 Kai Huang <kai.huang@intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>,
 chen.bo@intel.com, linux-coco@lists.linux.dev,
 Chao Peng <chao.p.peng@linux.intel.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Vishal Annapurve <vannapurve@google.com>, Yuan Yao
 <yuan.yao@linux.intel.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Xu Yilun <yilun.xu@intel.com>, Quentin Perret <qperret@google.com>,
 wei.w.wang@intel.com, Fuad Tabba <tabba@google.com>
References: <cover.1695327124.git.isaku.yamahata@intel.com>
 <ZQynx5DyP56/HAxV@google.com>
 <20230922194029.GA1206715@ls.amr.corp.intel.com>
 <ZQ3573rbNQpbNf09@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH v2 0/6] KVM: gmem: Implement test cases for
 error_remove_page
In-Reply-To: <ZQ3573rbNQpbNf09@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/23 22:32, Sean Christopherson wrote:
> Unless we can't extend fadvise() for some reason, I think we should pursue
> FADV_HWPOISION.  The enabling should be downright trivial, e.g. just implement
> file_operations.fadvise() for guest_memfd, have it handle FADV_HWPOISON, and pass
> everything else to generic_fadvise().
> 
> It'll basically be your ioctl() just without a dedicated ioctl().
> 
> At the very least, we should run the idea past the fs maintainers.

fadvise() is different from madvise() though and not necessarily a great 
match.  Looking at the list of flags in advise(), something like 
FADV_POPULATE_READ, FADV_PAGEOUT or FADV_COLD would make sense, but I 
can't really think of any other flag that would be useful in a general 
case for fadvise.  Everything else would have to be very spcific to 
memfd or guest_memfd.

In particular FADV_HWPOISON would not make sense for anything that is 
not backend by memory.  There are some flags that could be useful on 
gmem file descriptors, such as hypothetically {WIPE,KEEP}ONFORK or 
SOFT_OFFLINE, but again they're not something that can be applied to 
fadvise().

So a ioctl implementation does have some advantages after all.  I 
suggest that we reuse MADV_* flags in the ioctl arguments, to leave the 
door open for future extensions and avoid ioctl proliferation.  The 
ioctl could be implemented by memfd, too, and perhaps even by /dev/zero.

Paolo

