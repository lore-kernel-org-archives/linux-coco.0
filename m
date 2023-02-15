Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790426109
	for <linux-coco@lists.linux.dev>; Wed, 15 Feb 2023 16:03:26 +0000 (UTC)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31FF8WZo017044;
	Wed, 15 Feb 2023 16:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date : from
 : subject : to : content-type : content-transfer-encoding : mime-version;
 s=pp1; bh=A0p6IWU4kCL3nOEAy4s+YdWhTAPgkGqimKxeaWTJNg4=;
 b=UGFxR28s/k+dZ38kJfhGioSTe4P+OqIp/C9i/e/94MtFiey2HGcS2KY8Yb+yjzGzIQcA
 wruslL1BkaFbCIJzaHLEqu6Nlvce0vUvlcNgSjjE//Rx7vpNom4h+4kNr1W79bcEQJb5
 H5OJLds9vQo1Jdc5XTVfwjxmc0U56lYpNFzWFgc5LAk+/eIM4J1sPs/sLpwEjSWoSL0m
 U5g1ALuoVwEAKlDiQBJO69zl6m4X14PXam+LxGRMUS1nz0dblaFHal3+/yqj9qV/43cw
 QMxI8JpTlO9b9xKaWeSdCiW3l7wJytdJBOD0dNDforAk0OtefmcbnZoEEgn5tEHA+2iM kg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ns09kwtyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 16:03:23 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31FG1MmV000999;
	Wed, 15 Feb 2023 16:03:22 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3np2n7k77d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 16:03:22 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31FG3K0A49348900
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Feb 2023 16:03:21 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8E6B58055;
	Wed, 15 Feb 2023 16:03:20 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 758F75806F;
	Wed, 15 Feb 2023 16:03:20 +0000 (GMT)
Received: from [9.160.189.66] (unknown [9.160.189.66])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Feb 2023 16:03:20 +0000 (GMT)
Message-ID: <77ad131a-f8e0-5f07-13a5-6ef3352d79ff@linux.ibm.com>
Date: Wed, 15 Feb 2023 11:03:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Claudio Carvalho <cclaudio@linux.ibm.com>
Subject: Attestation report support to the SVSM
To: linux-coco@lists.linux.dev, amd-sev-snp@lists.suse.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CR6hJv73hiNS30Xy86YJ8hfN34wqbfs_
X-Proofpoint-ORIG-GUID: CR6hJv73hiNS30Xy86YJ8hfN34wqbfs_
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-15_06,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=630
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302150145

Since we have being discussing about the SVSM attestation and vTPM 
specification additions here, you might also be interested on the github 
pull request below. It adds attestation report support to the SVSM.

https://github.com/AMDESE/linux-svsm/pull/35

Thanks,
Claudio
