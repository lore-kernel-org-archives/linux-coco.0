Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF1938330C
	for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 12:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781873513; cv=none; b=Gxe0qA3yFFhDypyjNrN066IrWUDp5WL2K0Nr5fGRoxZdSyut63eD1gQwIjS9RVXc1k0tm+Rld9K5yc6nsWx4zYboao1jgcecOHI6qTJRndTVYZhnMeisPiWyQ2zVAOn49ZLiy7cEmVCQBbkrFjhiRjhki7ccyTNSA+nGyuFNQqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781873513; c=relaxed/simple;
	bh=AoSchuXJGAayDzDPFIuHozNVcqm/iWheUa1nSVya5uQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+Lh1OJ1w3d2uJRZgbeT64Us0FzEzs/IBGIQGCfIyCqNZY1RG6YfDQr9NgGwZZU1G3mm7N5Pa3R+aDH880DNJWoqPSDy5D9OtS7cNhmIP9v2rJGb0Aom75cORYVBEMLcsuCkDvsjnTUCq77ZiRI3IsyHe9G/Opd76Z7VFSDfIvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/YBscbG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/YBscbG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso21061125e9.3
        for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 05:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781873510; x=1782478310; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=laROZbWnzE0hCDsDDd6yA+mJoystSAqNpvIVq0sPclE=;
        b=L/YBscbGh/MoDxCZBwNkPhkkLz0kBmL0VC+rpTsX0VImxj4QDV0ArR8FUtKU5Nqp/Q
         TStjII8rXGHfGZXHOclCgXjQumPt/0/nr0MbS3G3obX5xcvIc4bKwtD/opaUmUORBz1K
         tXTFK/opTApf0fE0gBTYohKT19jJ4pb/G/yyoOl4Rdsn21lJmU7/jCGVkpvvATMIhsg5
         zU4iGc+qbRWYf+Rqxx0kD3rd0YDhMZ0+SMq4pGxq3tzMlpMPXQAeNng1iXDCVfj+W9h/
         R1wNV1u6y5de1/Ox8dfy6bv+ayYj7TYL25JS1flLCkPTh+NaUZmHf4Wteq3QxNuWC3hm
         PvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781873510; x=1782478310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=laROZbWnzE0hCDsDDd6yA+mJoystSAqNpvIVq0sPclE=;
        b=gGodsT2/G6d6ImSzR5KsT2f77CN91s7GxyFl4pLPC2HEHXPi2Aqud9xx3a151NDHIg
         TEgiySfpfguke6iLGV0vEC+tD36AskYdqnHpQgj48N/kxhd34G+p9hEi7nNexf8WQlML
         H+KM2Q4Xw+zbwKO+QpbqgF+MX3XwV6KhAArA23LeunSzQtATStSludZcQXTEdXXWpoV3
         x5zNfJU95SCXKEnAzfQIbUnlJYusi6qOsDKHL/fFKrwZVX8vFF0Whu82gZ/XpIQGTVw/
         rggD7QUvMi9fTLmbXxiD3ti+fXcDIHAFnbo/LRq18nO/0s1y4FQKW7NjE9zd9JgAbsim
         fp1g==
X-Forwarded-Encrypted: i=1; AFNElJ+zhCP0+oTR2Fc9UTzqYOO+yJyrMItXiizpFw75rUpPVFbzyEx25+V4b04omg3JZdxrnM8rObI5mrNZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yxg1G/1BvvWjrERQqB6AQ3KKIVcYiMeYuqv5HwWMC9ZM36Mkt/c
	t2vuEIITIoW8VWzu/kaUc/j01xJSeIp9vpoVCCdKPYWi06kwIo9KKMkO
X-Gm-Gg: AfdE7cnII/9BcHe14AlfDUxH5/1hY96GFHG8QuZCZ86L5gcMYbuc0AFaOOnwOFLliod
	yKVXjFc5T7je4uGY8zKZnZ6ysEPaP5I1wJonglBP8fsBpgDOznp4UXwJ+yhDQOBZqiuoNcKWNMG
	KEOexIr4kWlDhc+68BjsVszA4AiyHcJ5taMAvpQEpd9WKqfO/SMau8CC1zQrE4UIDF9PRFMmnuN
	LtAvA5f2MKihIyJFz2aOCGAD+4ydOGTSMFkTgXGehC9n+ag7YP76aj1RPwGQ/e//+4dy1JDPhee
	H49k4lWdHTrjt//8k45PsD/wZgaft9Gs553xNfOO0VsDSDOCz3IRGuVuZx9k0fYW4HtmIEKkXq2
	2SOJdgGp3fAqy6cFxk8H9RKA79V8+m1iUg2NlOV9DY8jGad9dxxLSstPCZ8oGAmURxgH6eva8Hk
	XrUL2iVjJVGSvLNvs3HkqV15GxtseFzaVkHHxfuNRTGD/pY1rTbTeE36NR6expG1knhJE5i8bwT
	9TEm2A=
X-Received: by 2002:a05:600c:8b10:b0:490:b00c:8e6a with SMTP id 5b1f17b1804b1-4923f58988dmr65892965e9.28.1781873510164;
        Fri, 19 Jun 2026 05:51:50 -0700 (PDT)
Received: from [10.128.11.42] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650c115fd8sm7984157f8f.35.2026.06.19.05.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 05:51:48 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <8e53844c-f2f8-4a4b-bf72-f3140c170d43@gmail.com>
Date: Fri, 19 Jun 2026 13:51:45 +0100
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/46] KVM: Make CONFIG_KVM_VM_MEMORY_ATTRIBUTES
 selectable
To: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev,
 binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com,
 david@kernel.org, jmattson@google.com, jthoughton@google.com,
 michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com,
 qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com,
 shivankg@amd.com, steven.price@arm.com, tabba@google.com,
 willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com,
 forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com,
 aneesh.kumar@kernel.org, liam@infradead.org,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
 linux-coco@lists.linux.dev
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-5-9d2959357853@google.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-5-9d2959357853@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ackerley,

On 6/19/26 01:31, Ackerley Tng via B4 Relay wrote:

>  config KVM_VM_MEMORY_ATTRIBUTES
> -	bool
> +	depends on KVM_SW_PROTECTED_VM || KVM_INTEL_TDX || KVM_AMD_SEV
> +	bool "Enable per-VM PRIVATE vs. SHARED attributes (for CoCo VMs)"

Sorry for the style nitpick, but could you keep the type and prompt as
the first attribute in the Kconfig option definition (like the other
options do)?

- Julian Braha
