Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC3E32E6BC
	for <linux-coco@lists.linux.dev>; Mon, 12 Oct 2026 16:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824056; cv=none; b=MwtKreczCW5yZeQyiBIFg4luz4uQ2l98yQ7JrEAVB60g2VzyzIWxCMStG5lJwgQqf1q8s43vYMXErNAlLW0txcqDWffpTkLp6WjoLe7PYhbltjNQO38qY3drbzEuJuYLwZodUjaT1PA96Y6Pt4voo5+hICAOs9IOZmJ5D5enq7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824056; c=relaxed/simple;
	bh=A56OfPZZVFGIDpDQ9XCz9cgezTjnSLv3WNc7P02MjjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jx5OApOFU30+QqGWnbsGNL+udE7FWxXSDLvkJz+BNacihJx1fzjasjSBeBVcZXCKtSpUTSPJe3HhxK+x0vke89A472fCVf72jLWOyhQxizbWx30KuO/sR2MGVNh4/A/FtAskf+cn3qE/IR50L/EP1E7F8+woLg+aLKcIPlVRH2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r1yNKPIu; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r1yNKPIu"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e8623790f8so82755ad.0
        for <linux-coco@lists.linux.dev>; Mon, 12 Oct 2026 09:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791824054; x=1792428854; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a0L3N3ZtqaociPWUQTHB7mjZkgiRjSPFirVt2JXOStg=;
        b=r1yNKPIuHqauDd2OsTBudDGtUzR+3ZiJI3aXnLXdBiACl7AU8YL4P6noqDVT/jzL9a
         kU6i3FAhl+JheyNTM4X0PPd1PA9gfC+Upw++W/ubTUB5HvypiFE154KuB2kqpdimEM9c
         J4lpD63EOQLdsfEsHM+BcbBIAMCaNm7VFFWQa55OEkM/2cvjnFffCqhSpNkLMD87z5IX
         qtYXB9dK+lQdoWxFfnYQuzAZ98ykZbkzbFji30ANus+Y2zhp8P1wWl6jFMXynVq4Hb//
         n0apaQ54id5k7SPwHar5bM6xBCUNeGbxsNf/Z7LSNMPvzSPyS0EY2nRlW3ARtoqLWbQ+
         huTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824054; x=1792428854;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a0L3N3ZtqaociPWUQTHB7mjZkgiRjSPFirVt2JXOStg=;
        b=WL9ybBFP3M9nPSfU5YGoVJCbaF51oH73U0Rko0wYuaZ663NDNmY+2fot1Ix9S/BkXy
         Xoehoo2pZWKSW8RJ5D09ITTrx6gsYii8CnLaf45C1EICj6DmyxpwOAtwjuTe3JlN8J4U
         qC9oYctQ54aZc3eRtLR7NXYbN/NsG1yeceHNRRzksKR7V454yrJ+9LdGQ4dp4ztrd0su
         TluvQjNdLUJoCVTwclORnrQfOCPP7uktCdc5NzDDxb1FpyDfi8olSnhbo2lfhIuHEXKO
         XSnlZ6gz4VlgUaQYmWgBG8Sizo/wOJaaaNZD5T/ej6qrUnN9EEb+ujTRepfRYtrvJ1wF
         TwlA==
X-Forwarded-Encrypted: i=1; AKwUvByz6wcXkpnsEX9Kdjppzqch9FJKI6rGY+aVS3Miumkh6T0OLOEmwo4essjVGA+j7DWbyWShQ+dwIMLI@lists.linux.dev
X-Gm-Message-State: AFq9FYJZ2Cf4odhImcyFBBH67K0FVflHw5Z7PLYKJVxBEAziCTRBwU9j
	54rsBTAQxdBrFgqShBJAS6O7Bpxp0SZR9bvCp/Fl5MMJL0Yhionog5hzCxvJvsFoow==
X-Gm-Gg: AYBFou3rzMneZmYFncBMr4NBpkhay4TBhfgFTQpV+CRIVEt2WyxD8+nNNqNYYFF2RUF
	WotqIB9vpU6luLCw7GYbGxlw8gx0CxIDqaS7LOS3TeWWswtJY6gpkYdTDmHr7Cd8sRgqYW3x/Fw
	8j2E/QI0iOc4B/hZ7F1DNNwMNpqUwAZUZrqmpNzE1iFdtgovu5+HO+qkZIXcj8fSrpc5MIPaInV
	UKh1NMubh3nF+r4vsc2drtIbk/fEahzpoDj3mQzh8NgrE44L9RNqqNLzpyFIELgqyk2JIgw9XaW
	fc7C5V0usGtqGOlQqIhLoWIhtMZdf1MXb1OrF11q9yc5yE5e7L79zBZIRt4TS6dZaiT73WanHj4
	cY4xX3GinXPa/CRFi/gu9ORYbPiIL2NhJf0fqJeVU89p7dN+B2kjjKIka2yLMeGD5ybdabNiQPj
	jCvJHqLwJBzfixnshcCD12bT7ddnSetcJIzCtD3MJwkI/BxFngbbG2TINcUjHhUkxK1XzhUNgsT
	QLGXfb6IL824g9jlliAYmEAaRE3Fi2C
X-Received: by 2002:a17:903:390b:b0:2e6:1917:fa with SMTP id d9443c01a7336-2e87e2f872bmr6833435ad.7.1791824053720;
        Mon, 12 Oct 2026 09:54:13 -0700 (PDT)
Received: from google.com (75.57.168.34.bc.googleusercontent.com. [34.168.57.75])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab393efd88sm10301280a91.3.2026.10.12.09.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:54:13 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:54:09 +0000
From: Lisa Wang <wyihan@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Binbin Wu <binbin.wu@linux.intel.com>,
	Chao Gao <chao.gao@intel.com>,
	Chenyi Qiang <chenyi.qiang@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Roger Wang <runanwang@google.com>,
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v15 11/23] KVM: selftests: Set shared attributes for
 ucall guest_memfd pages
Message-ID: <as0QsZtRAEEq5Tpw@google.com>
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
 <20261001-tdx-selftests-v15-11-7c62a5d8a992@google.com>
 <7ca516ea-a931-4497-b3c8-b62110ae006a@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ca516ea-a931-4497-b3c8-b62110ae006a@intel.com>

On Fri, Oct 09, 2026 at 11:44:55PM +0800, Xiaoyao Li wrote:
> On 10/2/2026 3:37 AM, Lisa Wang wrote:
> > The default attributes for guest_memfd pages without in-place conversion
> > is private. 
> 
> This is wrong. The default memory attribute is of a @gfn is shared without
> in-place conversion, i.e., with per-vm memory attribute.
> 
> We don't need this patch actually. And I have tested with reverting this patch,
> with both out of place conversion and in-place conversion. Both worked.
>

oh yes, I misunderstood the default memory attribute without in-place
conversion. I will drop this patch in the next series. Thanks!

Lisa
