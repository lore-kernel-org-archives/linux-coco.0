Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BAB331A52
	for <linux-coco@lists.linux.dev>; Fri, 19 Dec 2025 12:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766145983; cv=none; b=k+jaXsoipXzNfaTwmvojBqpd6O+Uta36MI6nonwrltpz0G79lbo+yAmcLSBcUNPZiM5VUC4g1scZMNIR0IfhhbFo5kMcxpRmrw1kfGlfnA6SyWR4enRDGJR4mgeVQ9EfZYeue21I65afF4uSp0VvR9VXnOmSOCEoR2v5E/poagQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766145983; c=relaxed/simple;
	bh=lPTWcqb09M9SIYecnJ6KVBkozHzUAjxvJUp1Iz0Z7Sk=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NI17w6BHMTyqrYyAI5M7HgxYoBxHGiM1AdFUIuHnFST1qAUElmJAL4/9xCBrfqjS7nTAdFuIjUbxZLMGluXhnZuSG88byTCbmJ/pARkaCa5kfzZNMpZCJMPWJv1n2BVOUM2xm8j+6JWq9+yywnezoHtHf6CyYIX2QNFOgCmWmyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dXmT606cPzJ46BZ;
	Fri, 19 Dec 2025 20:05:46 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 905D940569;
	Fri, 19 Dec 2025 20:06:18 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 19 Dec
 2025 12:06:17 +0000
Date: Fri, 19 Dec 2025 12:06:16 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
CC: <linux-coco@lists.linux.dev>, <linux-pci@vger.kernel.org>,
	<chao.gao@intel.com>, <dave.jiang@intel.com>, <baolu.lu@linux.intel.com>,
	<yilun.xu@intel.com>, <zhenzhong.duan@intel.com>, <kvm@vger.kernel.org>,
	<rick.p.edgecombe@intel.com>, <dave.hansen@linux.intel.com>,
	<dan.j.williams@intel.com>, <kas@kernel.org>, <x86@kernel.org>
Subject: Re: [PATCH v1 26/26] coco/tdx-host: Finally enable SPDM session and
 IDE Establishment
Message-ID: <20251219120616.00000890@huawei.com>
In-Reply-To: <20251117022311.2443900-27-yilun.xu@linux.intel.com>
References: <20251117022311.2443900-1-yilun.xu@linux.intel.com>
	<20251117022311.2443900-27-yilun.xu@linux.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml100005.china.huawei.com (7.214.146.113)

On Mon, 17 Nov 2025 10:23:10 +0800
Xu Yilun <yilun.xu@linux.intel.com> wrote:

> The basic SPDM session and IDE functionalities are all implemented,
> enable them.
> 
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
Hard to disagree with this one :)
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
